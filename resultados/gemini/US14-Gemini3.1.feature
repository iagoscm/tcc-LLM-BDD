Feature: Gerenciamento de Chaves Secretas
Como um cliente de empresa de software, eu quero acessar as chaves secretas da aplicação
para gerenciá-las de forma segura.

Pré-condição:
Dado que eu estou na página de "Configurações de Segurança"

@caminho-feliz @smoke
Cenário: Gerar uma nova chave secreta com sucesso
Quando eu clico no botão "Gerar Nova Chave"
E eu insiro o nome da chave "Chave de Integração"
E eu clico no botão "Confirmar"
Então eu devo ver a nova chave secreta gerada na tela
E eu devo ver a mensagem de aviso "Copie sua chave agora. Ela não será exibida novamente."

@cenario-de-excecao
Cenário: Tentativa de revelar uma chave secreta com código de segurança incorreto
Quando eu clico no botão "Revelar Chave"
E eu insiro o código de autenticação de dois fatores "000000"
E eu clico no botão "Validar"
Então eu devo ver a mensagem de erro "Código de verificação inválido. Acesso negado."
E a chave secreta deve permanecer oculta