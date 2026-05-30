Feature: Login de Estudante via BC Services Card
Como um estudante, eu quero fazer login na minha conta SABC criada para acessar os serviços SABC.

Pré-condição:
Dado que eu estou na página de login do SABC

@caminho-feliz @smoke
Cenário: Login bem-sucedido com BC Services Card
Quando eu clico no botão "Entrar com BC Services Card"
E eu realizo a autenticação com sucesso no BC Services Card
Então eu devo ser redirecionado para a página "/dashboard"

@cenario-de-excecao
Cenário: Falha na autenticação do BC Services Card
Quando eu clico no botão "Entrar com BC Services Card"
E eu realizo a autenticação sem sucesso no BC Services Card
Então eu devo ver a mensagem de erro "Falha na autenticação. Verifique suas credenciais."

@cenario-de-excecao
Cenário: BC Services Card não vinculado a uma conta SABC
Quando eu clico no botão "Entrar com BC Services Card"
E eu realizo a autenticação com sucesso no BC Services Card, mas o cartão não está associado a nenhuma conta SABC
Então eu devo ver a mensagem de erro "Nenhuma conta SABC encontrada para este BC Services Card."

@cenario-de-excecao
Cenário: Indisponibilidade do serviço BC Services Card
Quando eu clico no botão "Entrar com BC Services Card"
E o serviço BC Services Card está indisponível
Então eu devo ver a mensagem de erro "Serviço de autenticação temporariamente indisponível. Tente novamente mais tarde."