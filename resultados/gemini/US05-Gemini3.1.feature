Feature: Verificação Consolidada de Status de CI para Avaliações de LLM
Como um Revisor de PR, eu quero uma única verificação de status de CI consolidada para todas as avaliações de LLM para que eu possa ver as aprovações/falhas por habilidade em um só lugar, sem precisar cruzar dados de múltiplos resultados e trabalhos de CI.

Pré-condição:
Dado que o repositório possui o arquivo de configuração ".vally.yaml" na raiz e o fluxo de trabalho ".github/workflows/evals.yml" configurado

@caminho-feliz @smoke @ci-workflow
Cenário: Execução bem-sucedida do fluxo de CI em um PR com geração de artefatos
Quando eu abro ou atualizo um PR com novos arquivos de avaliação
E o trabalho "smoke" executa o comando "vally eval --suite smoke"
Então a execução deve ser concluída em menos de 30 segundos
E as chamadas de LLM devem ser zero
E os artefatos "JUnit XML", "JSONL" e o resumo em "Markdown" devem ser gerados e anexados ao PR

@cenario-de-excecao @lint
Cenário: Falha no CI devido a erros de esquema na configuração de avaliação
Quando eu envio um PR contendo arquivos de avaliação com erros de esquema intencionais
E o trabalho "lint" executa o comando "vally lint --strict"
Então a etapa de lint deve falhar imediatamente (em menos de 5 segundos)
E eu devo ver uma mensagem de erro indicando o problema no esquema
E as etapas subsequentes de avaliação não devem ser executadas

@caminho-feliz @nightly
Cenário: Execução agendada noturna para as suítes completas e de conflitos
Quando o gatilho de agendamento noturno (schedule) é ativado
Então o sistema deve executar o trabalho "nightly-full" usando "vally eval --suite full"
E o sistema deve executar o trabalho "nightly-conflicts" usando "vally eval --suite conflicts"
E os resultados devem ser consolidados no diretório "results/" no formato JSONL

@caminho-feliz @migracao
Cenário: Validação de equivalência do script de migração
Quando eu executo o script "scripts/validate-migration.sh" comparando os resultados antigos do Jest/Waza com os novos
Então o script deve reportar 0 discrepâncias para as suítes totalmente migradas
E a equivalência entre os sistemas deve ser confirmada com sucesso