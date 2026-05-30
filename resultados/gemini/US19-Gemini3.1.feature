Feature: Autenticação de Estudante na Conta SABC
Como um estudante, eu quero poder fazer login na minha conta SABC criada
para acessar os serviços do SABC.

Pré-condição:
Dado que eu estou na página de login do sistema SABC
E eu possuo uma conta SABC previamente criada com um DID válido

@caminho-feliz @smoke
Cenário: Login bem-sucedido com BC Services Card autenticado
Quando eu seleciono a opção de login via "BC Services Card"
E eu realizo a autenticação com sucesso no provedor do BC Services Card
Então eu devo ser redirecionado para a página inicial de serviços do SABC

@cenario-de-excecao
Cenário: Tentativa de login com falha na autenticação do BC Services Card
Quando eu seleciono a opção de login via "BC Services Card"
E a autenticação falha ou é cancelada no provedor do BC Services Card
Então eu devo ver a mensagem de erro "Falha na autenticação. Verifique seu BC Services Card e tente novamente."

@cenario-de-excecao
Cenário: Tentativa de login de um usuário sem conta SABC criada (sem DID)
Quando eu seleciono a opção de login via "BC Services Card"
E eu realizo a autenticação com sucesso no provedor do BC Services Card
Mas o meu perfil não possui um DID associado a uma conta SABC existente
Então eu devo ser redirecionado para a página de criação de conta SABC