Feature: Proteção de Dados do Cliente
  Como um cliente de uma empresa de software, eu quero que meus dados sejam protegidos contra divulgação não intencional para outros clientes ou partes externas.

  Pré-condição:
    Dado que eu estou autenticado como cliente da empresa "Alpha"

  @caminho-feliz @smoke
  Cenário: Acesso aos próprios dados sem vazamento de informações de outros clientes
    Quando eu acesso a página "Meus Dados"
    Então eu devo ver apenas os registros pertencentes à empresa "Alpha"
    E eu não devo ver nenhum registro de outras empresas

  @cenario-de-excecao
  Cenário: Tentativa de acessar dados de outro cliente por manipulação direta de URL
    Quando eu acesso a URL "/dados/empresa/Beta/123"
    Então eu devo ver a mensagem de erro "Acesso negado. Você não tem permissão para visualizar estes dados."
    E eu devo permanecer na página de dados da empresa "Alpha"

  @cenario-de-excecao
  Cenário: Usuário externo não autenticado tenta acessar dados de um cliente
    Dado que eu não estou autenticado no sistema
    Quando eu acesso a URL "/dados/empresa/Alpha/456"
    Então eu devo ser redirecionado para a página de login
    E eu devo ver a mensagem "Faça login para continuar"