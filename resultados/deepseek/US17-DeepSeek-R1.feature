Feature: Notificações baseadas em assinaturas
  Como um usuário, eu quero receber notificações baseadas nas minhas assinaturas para me manter atualizado sobre conteúdos e eventos relevantes.

  Pré-condição:
    Dado que eu estou logado no sistema

  @caminho-feliz @smoke
  Cenário: Receber notificação de novo conteúdo correspondente à assinatura
    Dado que eu possuo uma assinatura ativa para a categoria "Tecnologia"
    Quando um novo artigo é publicado na categoria "Tecnologia"
    Então eu devo receber uma notificação informando o título do artigo

  @cenario-de-excecao
  Cenário: Não receber notificação quando não há assinaturas
    Quando um novo conteúdo é publicado em qualquer categoria
    Então eu não devo receber nenhuma notificação