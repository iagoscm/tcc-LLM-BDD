Feature: Conversão de Testes de Gatilho (Trigger) para Vally
Como um Revisor de Qualidade/Avaliação (Quality/Eval Reviewer), eu quero que os testes de gatilho sejam convertidos para Vally usando avaliadores (graders) de correspondência estática e roteamento LLM para que eu possa validar o roteamento real de habilidades ponta a ponta e identificar conflitos automaticamente.

Pré-condição:
Dado que a estrutura base do Vally e os padrões de integração estão estabelecidos
E os novos graders ("keyword-match" e "llm-routing") estão implementados no repositório "ai-bench"

@caminho-feliz @smoke
Cenário: Avaliação de gatilho com grader estático (keyword-match)
Quando eu executo o grader "keyword-match" para um estímulo configurado com a tag "cost: free"
Então a execução deve levar menos de 100ms
E o resultado da extração de palavras-chave deve corresponder exatamente aos snapshots do TriggerMatcher do Jest

@caminho-feliz
Cenário: Avaliação de roteamento com LLM e detecção de conflitos
Quando eu executo o grader "llm-routing" para um estímulo configurado com a tag "type: conflict"
E a tag de custo é "cost: llm"
Então a execução da invocação deve levar menos de 30s
E o sistema deve reportar corretamente as habilidades concorrentes (ex: deploy-vs-prepare)

@caminho-feliz
Cenário: Execução da suíte completa de triggers convertidos
Quando eu executo o comando "vally eval --suite triggers"
Então todos os estímulos contidos nos 34 arquivos "triggers.eval.yaml" devem ser processados
E devem produzir os vereditos esperados de sucesso

@cenario-de-excecao
Cenário: Falha de performance por violação de tempo limite no grader estático
Quando eu aciono o grader estático "keyword-match"
E o tempo de resposta da invocação excede 100ms
Então o teste deve falhar reportando a violação da restrição de performance NFR-01

@cenario-de-excecao
Cenário: Falha de performance por violação de tempo limite no grader LLM
Quando eu aciono o grader "llm-routing" em um ambiente de CI
E o tempo de resposta da invocação excede 30s
Então o teste deve falhar reportando a violação da restrição de performance NFR-02