Feature: Login de Estudante no SABC

Como um estudante, eu quero fazer login na minha conta SABC criada
para acessar os serviços do SABC.

Pré-condição:
Dado que o estudante possui uma conta SABC criada
E que o estudante possui um BC Services Card autenticado
E que o estudante está na página de login do SABC

@caminho-feliz @smoke
Cenário: Login com BC Services Card autenticado
Quando o estudante seleciona a opção "Login com BC Services Card"
E o estudante autentica com um BC Services Card válido
Então o estudante deve acessar sua conta SABC
E o estudante deve ser redirecionado para a página "/dashboard"

@caminho-feliz
Cenário: Estudante realiza login em qualquer horário
Quando o estudante seleciona a opção "Login com BC Services Card"
E o estudante autentica com um BC Services Card válido
Então o estudante deve conseguir acessar os serviços do SABC

@cenario-de-excecao
Cenário: Tentativa de login com BC Services Card inválido
Quando o estudante seleciona a opção "Login com BC Services Card"
E o estudante autentica com um BC Services Card inválido
Então o estudante deve ver a mensagem de erro "Falha na autenticação do BC Services Card."

@cenario-de-excecao
Cenário: Tentativa de login sem conta SABC criada
Dado que o estudante não possui uma conta SABC criada
Quando o estudante seleciona a opção "Login com BC Services Card"
E o estudante autentica com um BC Services Card válido
Então o estudante deve ver a mensagem de erro "Conta SABC não encontrada."

@cenario-de-excecao
Cenário: Sessão de autenticação expirada durante o login
Quando o estudante seleciona a opção "Login com BC Services Card"
E a sessão de autenticação expira antes da conclusão do login
Então o estudante deve ver a mensagem de erro "Sua sessão expirou. Tente novamente."