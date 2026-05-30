Feature: Acesso Seguro a Chaves Secretas
Como um cliente da empresa de software, eu quero acessar as chaves secretas das minhas aplicações de forma segura.

Pré-condição:
Dado que eu estou autenticado e na página de chaves secretas da aplicação "MinhaApp"

@caminho-feliz @smoke
Cenário: Exibição de chave secreta com verificação de dois fatores
Quando eu solicito visualizar a chave secreta
E eu insiro o código de verificação "123456" recebido por SMS
E eu clico no botão "Confirmar"
Então a chave secreta deve ser exibida na tela
E eu devo ver a mensagem "Chave secreta exibida com sucesso."

@cenario-de-excecao
Cenário: Tentativa de visualizar chave secreta com código de verificação inválido
Quando eu solicito visualizar a chave secreta
E eu insiro o código de verificação "000000"
E eu clico no botão "Confirmar"
Então eu devo ver a mensagem de erro "Código de verificação inválido ou expirado."