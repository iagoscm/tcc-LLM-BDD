Feature: Limpeza da Infraestrutura de Avaliação Descontinuada
Como um Engenheiro de Plataforma, eu quero que toda a infraestrutura de avaliação descontinuada seja removida para que novos contribuidores vejam apenas um framework de avaliação e um pipeline de CI, eliminando confusões sobre qual sistema usar.

Pré-condição:
Dado que a validação de todas as migrações prévias (Issues 1 a 4) foi concluída
E o script de validação confirma zero discrepâncias e zero casos de teste perdidos

@caminho-feliz @smoke
Cenário: Remoção completa dos artefatos antigos e verificação de sucesso
Quando eu deleto os arquivos e diretórios do Waza, testes de integração do Jest e TriggerMatcher
E eu atualizo o "package.json" e o "jest.config.ts" removendo as dependências antigas
E eu executo a suíte de avaliações com "vally eval --suite full"
E eu executo os testes unitários restantes
Então todos os testes devem passar com sucesso
E a busca por "waza" fora de "docs/archive/" deve retornar zero resultados
E a busca por "TriggerMatcher" deve retornar zero resultados

@caminho-feliz
Cenário: Limpeza do pipeline de CI e validação de acionamento
Quando eu removo o arquivo ".github/workflows/eval.yml" antigo
E eu removo os jobs de testes de integração dos workflows existentes
E eu submeto um Pull Request de teste
Então o novo pipeline de CI unificado deve ser acionado corretamente

@cenario-de-excecao
Cenário: Tentativa de exclusão sem a validação prévia de migração
Dado que a validação da migração falha ou indica discrepâncias
Quando eu tento iniciar a exclusão da infraestrutura Waza ou Jest
Então a ação deve ser interrompida
E eu devo ver uma mensagem de erro indicando que as deleções só podem ocorrer após sucesso na migração

@cenario-de-excecao
Cenário: Alteração do Jest config quebrando os testes unitários
Quando eu atualizo o "jest.config.ts" para excluir os caminhos removidos
E eu executo os testes unitários restantes do Jest
Então nenhum teste unitário existente em "tests//unit.test.ts" deve falhar devido à mudança de configuração