Feature: Conversão de Testes de Gatilho para Vally com Graders Estático e de Roteamento LLM
  Como um Quality/Eval Reviewer, eu quero converter os testes de trigger para Vally com graders de keyword-match estático e roteamento LLM para validar o roteamento real de skills ponta a ponta e automaticamente identificar conflitos de skills concorrentes.

  Pré-condição:
    Dado que os estímulos de trigger foram convertidos para arquivos triggers.eval.yaml com tags de polaridade e custo
    E o grader keyword-match e o grader llm-routing estão registrados no Vally GraderRegistry
    E o roster completo de skills está disponível para o grader de roteamento LLM

  @caminho-feliz @smoke
  Cenário: Avaliação de estímulo positivo com grader keyword-match
    Quando eu executo o comando "vally eval --stimulus positivo_deploy_azure --grader keyword-match"
    Então o veredito deve ser "pass"
    E a evidência deve conter as palavras-chave casadas "deploy" e "Azure"
    E o tempo de execução deve ser inferior a 100ms

  @caminho-feliz
  Cenário: Avaliação de estímulo negativo com grader keyword-match
    Quando eu executo o comando "vally eval --stimulus negativo_sem_palavra_chave --grader keyword-match"
    Então o veredito deve ser "fail"
    E a evidência deve listar as palavras-chave não correspondidas

  @caminho-feliz
  Cenário: Roteamento LLM bem-sucedido para uma skill específica
    Dado que o estímulo "realizar deploy no Azure" está mapeado para a skill "azure-deploy"
    Quando eu executo o comando "vally eval --stimulus deploy_azure_simples --grader llm-routing"
    Então o veredito deve ser "pass"
    E a skill selecionada deve ser "azure-deploy"
    E o tempo de execução deve ser inferior a 30s

  @cenario-de-excecao
  Cenário: Falha no roteamento LLM quando uma skill incorreta é selecionada
    Dado que o estímulo "deploy no Azure" deve invocar exclusivamente "azure-deploy"
    Mas o ambiente de avaliação está configurado com um modelo de juiz que retorna "azure-prepare"
    Quando eu executo "vally eval --stimulus deploy_azure_prompt --grader llm-routing"
    Então o veredito deve ser "fail"
    E a evidência deve indicar que a skill selecionada foi "azure-prepare" em vez de "azure-deploy"

  @cenario-de-excecao @conflict
  Cenário: Detecção de conflito entre skills concorrentes pelo grader LLM
    Dado que o roster inclui "azure-deploy" e "azure-prepare" com descrições sobrepostas sobre deploy no Azure
    Quando eu submeto o estímulo do tipo "conflict" "deploy no Azure usando preparação" ao grader llm-routing
    Então o veredito deve ser "conflict"
    E o relatório de conflito deve listar "azure-deploy" e "azure-prepare" como skills candidatas

  @caminho-feliz @regression
  Cenário: Equivalência da extração de keywords com os snapshots Jest existentes
    Quando eu comparo a saída da extração de keywords do grader keyword-match com os snapshots dos testes de trigger originais
    Então todas as saídas devem ser idênticas aos snapshots
    E nenhuma diferença deve ser reportada

  @caminho-feliz @smoke
  Cenário: Execução completa da suíte de triggers com vereditos esperados
    Quando eu executo o comando "vally eval --suite triggers"
    Então todos os estímulos devem produzir os vereditos esperados
    E nenhum estímulo deve resultar em erro inesperado

  @caminho-feliz
  Cenário: Execução seletiva apenas de estímulos estáticos de baixo custo
    Dado que os estímulos estáticos estão marcados com cost: "free"
    Quando eu executo "vally eval --suite triggers --cost free"
    Então apenas os estímulos do tipo keyword-match devem ser avaliados
    E todos devem ser concluídos em menos de 100ms cada

  @caminho-feliz
  Cenário: Cobertura de testes unitários dos graders
    Quando eu executo a suíte de testes unitários do grader keyword-match
    Então a cobertura de código deve ser maior ou igual a 80%
    E quando executo a suíte de testes unitários do grader llm-routing
    Então a cobertura de código também deve ser maior ou igual a 80%