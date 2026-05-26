Feature: Conversão de testes de gatilho para Vally com graders de roteamento

Como um Quality/Eval Reviewer, eu quero converter testes de gatilho para Vally com graders estáticos e baseados em LLM para validar o roteamento real de skills e identificar conflitos entre skills concorrentes.

Pré-condição:
Dado que o repositório possui arquivos `triggers.test.ts` existentes
E que o Vally está configurado para executar suites de avaliação
E que os SKILL.md possuem descrições válidas para extração de palavras-chave

@caminho-feliz @smoke
Cenário: Registrar o grader keyword-match no GraderRegistry do Vally
Quando o grader "keyword-match" for inicializado
Então ele deve ser registrado no "GraderRegistry"
E ele deve estar disponível para execução em avaliações Vally

@caminho-feliz
Cenário: Executar keyword-match grader com correspondência positiva
Quando o stimulus possuir o texto "deploy to Azure"
E a descrição do skill contiver a palavra-chave "deploy"
Então o grader deve retornar o resultado "pass"
E deve incluir evidências de palavras-chave encontradas
E deve incluir evidências de palavras-chave não encontradas

@cenario-de-excecao
Cenário: Executar keyword-match grader sem correspondência de palavras-chave
Quando o stimulus possuir o texto "generate unit tests"
E a descrição do skill não contiver palavras relacionadas
Então o grader deve retornar o resultado "fail"
E deve listar todas as palavras-chave não encontradas

@caminho-feliz
Cenário: Executar llm-routing grader validando skill correta
Quando o stimulus possuir o texto "deploy this application to Azure"
E a skill disponível for "azure-deploy"
Então o LLM deve selecionar a skill "azure-deploy"
E o grader deve retornar o resultado "pass"

@cenario-de-excecao
Cenário: Detectar skill incorreta durante o roteamento LLM
Quando o stimulus possuir o texto "prepare Azure infrastructure"
E a skill esperada for "azure-prepare"
Mas o LLM selecionar a skill "azure-deploy"
Então o grader deve retornar o resultado "fail"
E deve informar a skill esperada e a skill selecionada

@caminho-feliz
Cenário: Detectar conflito entre skills concorrentes
Quando o stimulus possuir o texto "deploy to Azure"
E as skills disponíveis forem:
| skill              |
| azure-deploy       |
| azure-prepare      |
| cloud-migrate      |
Então o grader deve identificar skills concorrentes
E deve reportar "azure-deploy" como skill principal
E deve incluir "azure-prepare" como skill conflitante

@caminho-feliz
Cenário: Converter prompts de trigger tests para triggers.eval.yaml
Quando os prompts do arquivo "triggers.test.ts" forem processados
Então um arquivo "triggers.eval.yaml" deve ser gerado
E cada prompt deve ser convertido em um stimulus inline
E cada stimulus deve possuir uma tag de polaridade

@caminho-feliz
Cenário: Criar stimuli positivos e negativos
Quando um prompt representar um caso válido de invocação de skill
Então o stimulus deve possuir a tag "positive"
Quando um prompt representar um caso inválido de invocação de skill
Então o stimulus deve possuir a tag "negative"

@caminho-feliz
Cenário: Criar stimuli de conflito entre skills
Quando existir sobreposição entre skills
Então deve ser criado um stimulus com type "conflict"
E o stimulus deve incluir as skills concorrentes relacionadas

@caminho-feliz
Cenário: Executar avaliações em modo dual com custo free e llm
Quando a suite de triggers for executada em CI
Então os stimuli com custo "free" devem executar o keyword-match grader
E os stimuli com custo "llm" devem executar o llm-routing grader

@cenario-de-excecao
Cenário: Falhar execução quando o tempo máximo do keyword-match for excedido
Quando o keyword-match grader levar mais de 100ms para responder
Então a execução deve ser marcada como "fail"
E deve informar violação da restrição "NFR-01"

@cenario-de-excecao
Cenário: Falhar execução quando o tempo máximo do llm-routing for excedido
Quando o llm-routing grader levar mais de 30 segundos para responder
Então a execução deve ser marcada como "fail"
E deve informar violação da restrição "NFR-02"

@caminho-feliz
Cenário: Validar equivalência de snapshots do TriggerMatcher
Quando a extração de palavras-chave for executada
Então os resultados devem corresponder aos snapshots existentes
E nenhuma regressão deve ser identificada

@caminho-feliz
Cenário: Executar suite de avaliações triggers no Vally
Quando o comando "vally eval --suite triggers" for executado
Então todos os stimuli devem produzir os vereditos esperados
E os resultados devem ser exibidos sem erros

@cenario-de-excecao
Cenário: Falhar execução quando um arquivo triggers.eval.yaml estiver ausente
Quando a suite de triggers for executada
E o arquivo "triggers.eval.yaml" de uma skill não existir
Então a execução deve retornar erro de configuração
E deve informar a skill afetada

@caminho-feliz
Cenário: Garantir compatibilidade cross-platform dos graders
Quando os graders forem executados em diferentes sistemas operacionais
Então os resultados devem ser consistentes
E nenhuma dependência específica de plataforma deve ser utilizada

@cenario-de-excecao
Cenário: Falhar geração de stimulus com metadata inválida
Quando um stimulus não possuir tag de polaridade
Ou não possuir configuração de grader
Então a validação do arquivo YAML deve falhar
E deve informar o campo inválido no stimulus
