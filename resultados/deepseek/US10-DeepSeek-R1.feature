Feature: Controle de Acesso de Cliente
  Como um cliente de uma empresa de software, as contas devem poder executar apenas as ações ou acessar os recursos que lhes foram explicitamente concedidos.

  Pré-condição:
    Dado que eu estou autenticado como "cliente@exemplo.com" com permissão apenas para acessar "Meus Pedidos"

  @caminho-feliz @smoke
  Cenário: Acesso a recurso permitido
    Quando eu acesso a página "Meus Pedidos"
    Então eu devo ver a lista de pedidos

  @cenario-de-excecao
  Cenário: Tentativa de acesso a recurso não autorizado
    Quando eu tento acessar a página "Relatórios Administrativos"
    Então eu devo ver a mensagem "Acesso negado. Você não tem permissão para acessar este recurso."