Feature: Personalização da Carta de Resumo de Benefício e Verificação de Serviço

  Como usuário, eu quero personalizar minha Carta de Resumo de Benefício e Verificação de Serviço para que possa utilizá-la para múltiplas finalidades (como assistência habitacional, isenção fiscal, etc.).

  Pré-condição:
    Dado que eu estou na página de personalização da carta

  @caminho-feliz @smoke
  Cenário: Personalizar carta para assistência habitacional com sucesso
    Quando eu seleciono a finalidade "Assistência Habitacional"
    E eu marco a opção "Incluir informações de renda"
    E eu clico no botão "Gerar Carta"
    Então eu devo ver uma prévia da carta contendo as informações de renda
    E eu posso clicar no botão "Baixar PDF" para obter o documento

  @cenario-de-excecao
  Cenário: Tentativa de gerar carta sem selecionar uma finalidade
    Quando eu não seleciono nenhuma finalidade
    E eu clico no botão "Gerar Carta"
    Então eu devo ver a mensagem de erro "Por favor, selecione uma finalidade para a carta."