Feature: Validação de entrada de dados do cliente
  Como cliente da empresa de software, eu quero que o serviço web valide os dados de entrada
  para que apenas informações corretas sejam processadas e armazenadas.

  Pré-condição:
    Dado que eu estou na página de submissão de dados

  @caminho-feliz @smoke
  Cenário: Submissão de dados com todos os campos válidos
    Quando eu preencho o campo "Nome" com "João Silva"
    E eu preencho o campo "Email" com "joao@exemplo.com"
    E eu preencho o campo "CNPJ" com "12.345.678/0001-90"
    E eu clico no botão "Enviar"
    Então eu devo ver a mensagem "Dados enviados com sucesso."

  @cenario-de-excecao
  Cenário: Submissão com campo obrigatório em branco
    Quando eu deixo o campo "Nome" vazio
    E eu preencho o campo "Email" com "joao@exemplo.com"
    E eu clico no botão "Enviar"
    Então eu devo ver a mensagem de erro "O campo Nome é obrigatório."

  @cenario-de-excecao
  Cenário: Submissão com formato de email inválido
    Quando eu preencho o campo "Email" com "email_invalido"
    E eu preencho os demais campos obrigatórios corretamente
    E eu clico no botão "Enviar"
    Então eu devo ver a mensagem de erro "Formato de email inválido."

  @cenario-de-excecao
  Cenário: Submissão com CNPJ em formato inválido
    Quando eu preencho o campo "Nome" com "João Silva"
    E eu preencho o campo "Email" com "joao@exemplo.com"
    E eu preencho o campo "CNPJ" com "123"
    E eu clico no botão "Enviar"
    Então eu devo ver a mensagem de erro "CNPJ inválido."