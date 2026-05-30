Feature: Validação de Entrada no Web Service
Como um Cliente da empresa de software, eu quero que o web service valide a entrada de dados para garantir que apenas informações corretas sejam processadas.

Pré-condição:
Dado que eu configuro uma requisição para o endpoint "/api/cadastro"

@caminho-feliz @smoke
Cenário: Envio de requisição com todos os dados válidos
Quando eu insiro o campo "nome" com o valor "Maria Souza"
E eu insiro o campo "idade" com o valor "28"
E eu envio a requisição POST
Então eu devo receber o status "201 Created"
E a resposta deve confirmar o processamento com sucesso

@cenario-de-excecao
Cenário: Tentativa de envio com formato de dado inválido
Quando eu insiro o campo "nome" com o valor "Maria Souza"
E eu insiro o campo "idade" com o valor "Vinte e Oito"
E eu envio a requisição POST
Então eu devo receber o status "400 Bad Request"
E eu devo ver a mensagem de erro "Formato de entrada inválido. O campo idade deve ser numérico."

@cenario-de-excecao
Cenário: Tentativa de envio com campo obrigatório ausente
Quando eu deixo o campo "nome" em branco
E eu insiro o campo "idade" com o valor "28"
E eu envio a requisição POST
Então eu devo receber o status "400 Bad Request"
E eu devo ver a mensagem de erro "Entrada inválida. O campo nome é obrigatório."