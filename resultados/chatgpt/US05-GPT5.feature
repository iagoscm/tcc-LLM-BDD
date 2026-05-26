Feature: Pipeline unificado de avaliações LLM com Vally

Como um PR Reviewer, eu quero um único status consolidado de CI para todas as avaliações LLM
para visualizar aprovação/reprovação por skill em um único local sem cruzar resultados de múltiplos workflows.

Pré-condição:
Dado que o repositório possui a configuração do Vally habilitada
E que o workflow ".github/workflows/evals.yml" está configurado
E que o diretório "results/" existe e está versionado com ".gitkeep"

@caminho-feliz @smoke
Cenário: Executar validação de lint do Vally com sucesso
Quando o workflow executar o comando "vally lint --strict"
Então a validação deve finalizar sem erros
E o tempo de execução deve ser inferior a "5s"

@cenario-de-excecao
Cenário: Detectar erro de schema no lint do Vally
Quando o workflow executar o comando "vally lint --strict"
E existir um arquivo de avaliação com schema inválido
Então a execução deve falhar
E a mensagem de erro deve indicar inconsistência de schema

@caminho-feliz @smoke
Cenário: Executar a suíte smoke sem chamadas LLM
Quando o workflow executar o comando "vally eval --suite smoke"
Então a suíte deve finalizar com sucesso
E o tempo de execução deve ser inferior a "30s"
E nenhuma chamada LLM deve ser realizada
E os resultados devem ser gerados em "./results/smoke/"

@cenario-de-excecao
Cenário: Falhar execução da suíte smoke por timeout
Quando o workflow executar o comando "vally eval --suite smoke"
E a execução ultrapassar o tempo limite permitido
Então o job deve falhar
E o status consolidado deve indicar falha da suíte "smoke"

@caminho-feliz
Cenário: Executar a suíte PR após conclusão da suíte smoke
Quando o job "smoke" finalizar com sucesso
E o workflow executar o comando "vally eval --suite pr"
Então a suíte PR deve ser iniciada
E os resultados devem ser gerados em "./results/pr/"
E o tempo de execução deve ser inferior a "2min"

@cenario-de-excecao
Cenário: Bloquear execução da suíte PR após falha na suíte smoke
Quando o job "smoke" falhar
Então o job "pr-evals" não deve ser executado
E o status consolidado deve indicar falha no pipeline

@caminho-feliz
Cenário: Executar suíte full no agendamento noturno
Quando o workflow for iniciado por agendamento noturno
E o comando "vally eval --suite full" for executado
Então os resultados devem ser gerados em "./results/full/"
E o tempo de execução deve respeitar o timeout configurado do CI

@cenario-de-excecao
Cenário: Falhar execução da suíte full por exceder timeout
Quando o workflow executar a suíte "full"
E o tempo de execução ultrapassar o timeout do job
Então o workflow deve falhar
E o relatório consolidado deve indicar timeout da suíte

@caminho-feliz
Cenário: Executar suíte conflicts no agendamento noturno
Quando o workflow for iniciado por agendamento noturno
E o comando "vally eval --suite conflicts" for executado
Então os resultados devem ser gerados em "./results/conflicts/"
E o tempo de execução deve ser inferior a "10min"

@caminho-feliz
Cenário: Gerar artefatos de execução das avaliações
Quando qualquer suíte de avaliação finalizar
Então o workflow deve gerar artefatos JUnit XML
E o workflow deve gerar artefatos JSONL
E o workflow deve gerar um resumo em Markdown
E todos os artefatos devem ser publicados no CI

@cenario-de-excecao
Cenário: Falhar upload de artefatos do workflow
Quando a geração de artefatos for concluída
E ocorrer falha no upload dos arquivos
Então o workflow deve registrar erro de publicação
E o status consolidado deve indicar falha de artifacts

@caminho-feliz
Cenário: Executar avaliações de gatilho no modo gratuito em PR
Quando uma Pull Request for aberta
E o workflow executar avaliações de gatilho
Então apenas avaliações com filtro "cost: free" devem ser executadas
E nenhuma avaliação com roteamento LLM deve ser chamada

@caminho-feliz
Cenário: Executar avaliações completas de gatilho no modo noturno
Quando o workflow for iniciado por agendamento noturno
Então avaliações de roteamento LLM devem ser executadas
E a suíte completa de triggers deve ser incluída na execução

@caminho-feliz
Cenário: Validar equivalência entre pipeline antigo e novo
Quando o script "scripts/validate-migration.sh" for executado
Então o relatório deve indicar "0 discrepancies"
E os resultados antigos e novos devem ser equivalentes

@cenario-de-excecao
Cenário: Detectar divergências na validação de migração
Quando o script "scripts/validate-migration.sh" for executado
E existirem diferenças entre os resultados antigos e novos
Então o relatório deve listar as discrepâncias encontradas
E a validação deve finalizar com falha

@caminho-feliz
Cenário: Publicar status consolidado por skill na Pull Request
Quando todas as suítes obrigatórias forem concluídas
Então um resumo consolidado deve ser publicado na Pull Request
E o resumo deve apresentar status de aprovação e reprovação por skill
E o PR Reviewer não deve precisar consultar múltiplos workflows

@caminho-feliz
Cenário: Manter diretório de resultados ignorado pelo Git
Quando o arquivo ".gitignore" for atualizado
Então o diretório "results/" deve estar ignorado
E o arquivo "results/.gitkeep" deve permanecer versionado

@caminho-feliz
Cenário: Disponibilizar documentação de migração e autoria de evals
Quando a documentação do projeto for publicada
Então o arquivo "docs/migration-guide.md" deve existir
E o arquivo "docs/eval-authoring-guide.md" deve existir
E a documentação deve conter instruções de conversão e autoria de avaliações