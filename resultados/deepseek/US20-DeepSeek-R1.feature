Feature: Atualização de Informações de Contato do Estudante
  Como um estudante, eu quero atualizar minhas informações de contato para que eu possa garantir que meu endereço e número de telefone estejam atualizados.

  Pré-condição:
    Dado que eu estou logado como um estudante
    E eu estou na página "Informações de Contato"

  @caminho-feliz @smoke
  Cenário: Atualizar endereço e telefone com dados válidos
    Quando eu preencho o campo "Endereço" com "Rua das Flores, 123"
    E eu preencho o campo "Telefone" com "(11) 98765-4321"
    E eu clico no botão "Salvar"
    Então eu devo ver a mensagem "Informações atualizadas com sucesso."
    E o campo "Endereço" deve exibir "Rua das Flores, 123"
    E o campo "Telefone" deve exibir "(11) 98765-4321"

  @caminho-feliz
  Cenário: Visualizar informações de contato com campos somente leitura e sem SIN
    Então eu devo ver os campos "Primeiro Nome", "Nome do Meio", "Sobrenome", "Data de Nascimento", "Email" e "Gênero" como somente leitura
    E eu não devo ver o campo "SIN"
    E os campos "Endereço" e "Telefone" devem estar habilitados para edição

  @cenario-de-excecao
  Cenário: Tentativa de salvar com telefone em formato inválido
    Quando eu preencho o campo "Telefone" com "abc123"
    E eu clico no botão "Salvar"
    Então eu devo ver a mensagem de erro "Formato de telefone inválido."

  @cenario-de-excecao
  Cenário: Tentativa de salvar com endereço vazio
    Quando eu limpo o campo "Endereço"
    E eu clico no botão "Salvar"
    Então eu devo ver a mensagem de erro "O campo Endereço é obrigatório."