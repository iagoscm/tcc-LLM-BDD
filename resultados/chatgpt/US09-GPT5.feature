Feature: Validação de Entrada no Web Service

Como um cliente de empresa de software, eu quero que o web service valide os dados de entrada
para garantir que apenas informações válidas sejam processadas.

Pré-condição:
Dado que o web service está disponível
E que o endpoint de validação está acessível

@caminho-feliz @smoke
Cenário: Envio de dados válidos para o web service
Quando eu envio uma requisição com os seguintes dados válidos:
| campo       | valor                |
| nome        | João Silva           |
| email       | joao@email.com       |
| telefone    | 11999999999          |
Então o web service deve retornar o status "200"
E eu devo receber a mensagem "Dados processados com sucesso"

@cenario-de-excecao
Cenário: Envio de requisição com email inválido
Quando eu envio uma requisição com os seguintes dados:
| campo       | valor             |
| nome        | João Silva        |
| email       | joao-email.com    |
| telefone    | 11999999999       |
Então o web service deve retornar o status "400"
E eu devo receber a mensagem de erro "Email inválido"

@cenario-de-excecao
Cenário: Envio de requisição com campo obrigatório ausente
Quando eu envio uma requisição sem informar o campo "nome"
Então o web service deve retornar o status "400"
E eu devo receber a mensagem de erro "O campo nome é obrigatório"

@cenario-de-excecao
Cenário: Envio de requisição com telefone em formato inválido
Quando eu envio uma requisição com os seguintes dados:
| campo       | valor          |
| nome        | João Silva     |
| email       | joao@email.com |
| telefone    | abc123         |
Então o web service deve retornar o status "400"
E eu devo receber a mensagem de erro "Telefone inválido"

@caminho-feliz
Cenário: Envio de requisição com todos os campos obrigatórios preenchidos
Quando eu envio uma requisição contendo todos os campos obrigatórios corretamente preenchidos
Então o web service deve retornar o status "200"
E os dados devem ser validados com sucesso