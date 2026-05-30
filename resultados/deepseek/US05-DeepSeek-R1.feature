Feature: Status Consolidado de CI para Avaliações de LLM
  Como um revisor de PR, eu quero um único status de verificação consolidado para todas as avaliações de LLM
  para que eu possa ver aprovação/reprovação por habilidade em um só lugar, sem cruzar referências de
  resultados Jest, veredictos Waza e snapshots de triggers entre múltiplos jobs de CI.

  Pré-condição:
    Dado que o pipeline de CI unificado está configurado no repositório

  @caminho-feliz @smoke
  Cenário: Status consolidado exibe todas as habilidades aprovadas
    Dado que existe um Pull Request com alterações nos arquivos de avaliação
    Quando o Pull Request é sincronizado
    Então o job de lint deve ser executado com sucesso
    E o job de smoke deve ser executado com sucesso em menos de 60 segundos
    E o job de PR evals deve ser executado com sucesso e publicar um sumário em Markdown
    E o status de CI consolidado deve mostrar "passed" para todas as habilidades
    E os artefatos JUnit XML, JSONL e Markdown devem ser anexados ao workflow

  @caminho-feliz
  Cenário: Verificação de lint não encontra erros de esquema
    Dado que os arquivos de avaliação estão sintaticamente corretos
    Quando o job de lint é executado com a flag --strict
    Então nenhum erro de esquema deve ser reportado
    E o job deve concluir em menos de 5 segundos

  @caminho-feliz
  Cenário: Pipeline noturno executa suites completas com sucesso
    Dado que o workflow está configurado com gatilho schedule para execução noturna
    Quando o evento schedule dispara o workflow
    Então o job nightly-full deve executar a suite "full" e finalizar com sucesso dentro do timeout
    E o job nightly-conflicts deve executar a suite "conflicts" e finalizar com sucesso
    E os resultados devem ser armazenados em ./results/full/ e ./results/conflicts/ respectivamente

  @cenario-de-excecao
  Cenário: Falha na verificação de lint interrompe o pipeline
    Dado que um arquivo de avaliação contém um erro de esquema intencional
    Quando o job de lint é executado com a flag --strict
    Então o job de lint deve falhar com uma mensagem descrevendo o problema de esquema
    E o job de smoke não deve ser executado
    E o status de CI consolidado deve mostrar "failed" com detalhes do erro de lint

  @cenario-de-excecao
  Cenário: Timeout da suite de smoke gera falha no status consolidado
    Dado que a suite de smoke está configurada com um timeout de 30 segundos
    E uma avaliação de smoke ultrapassa esse limite
    Quando a suite de smoke é executada
    Então o job de smoke deve falhar por timeout
    E o status de CI consolidado deve mostrar "failed" e indicar a falha na suite de smoke

  @cenario-de-excecao
  Cenário: Falha em uma habilidade específica na suite de PR é refletida no status consolidado
    Dado que existe um Pull Request com alterações nos arquivos de avaliação
    E uma das avaliações da suite de PR está configurada para falhar intencionalmente
    Quando a suite de PR evals é executada
    Então o job de PR evals deve falhar
    E o status de CI consolidado deve listar a habilidade específica como "failed"
    E as demais habilidades devem aparecer como "passed" no mesmo status check

  @cenario-de-excecao
  Cenário: Falha no upload de artefatos não impede a publicação do status consolidado
    Dado que ocorre um erro durante o upload dos artefatos JUnit XML, JSONL ou Markdown
    Quando o pipeline de CI é executado
    Então o workflow deve registrar um alerta sobre a falha no upload
    Mas o status de CI consolidado ainda deve refletir os resultados das avaliações executadas