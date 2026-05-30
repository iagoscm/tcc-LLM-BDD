Feature: Controle de Acesso do Cliente
  Como um cliente de uma empresa de software, as contas devem ser capazes de realizar apenas as ações ou acessar recursos que lhes foram explicitamente concedidos.

  Pré-condição:
    Dado que eu estou autenticado como um cliente com permissões básicas

  @caminho-feliz @smoke
  Cenário: Acessar um recurso explicitamente concedido ao cliente
    Quando eu tento acessar a página “/meus-pedidos”
    Então eu devo visualizar a página “/meus-pedidos” com sucesso

  @cenario-de-excecao
  Cenário: Tentativa de acessar um recurso não autorizado para o cliente
    Quando eu tento acessar a página “/admin/usuarios”
    Então eu devo ver a mensagem de erro “Acesso negado. Você não possui permissão para acessar este recurso.”