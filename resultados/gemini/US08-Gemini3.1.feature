Feature: Proteção e Isolamento de Dados
Como um cliente de uma empresa de software, eu quero que meus dados sejam protegidos contra divulgação não intencional para garantir que outros clientes ou terceiros não tenham acesso a eles.

Pré-condição:
Dado que o sistema armazena informações de múltiplos clientes em um banco de dados compartilhado

@caminho-feliz @seguranca
Cenário: Acesso restrito e exclusivo aos próprios dados
Quando eu faço login com a conta "clienteA@exemplo.com"
E eu navego para a página "/meus-dados"
Então o sistema deve processar a requisição com sucesso
E eu devo visualizar apenas as informações pertencentes ao perfil do Cliente A

@cenario-de-excecao @seguranca
Cenário: Tentativa de acesso a informações de outro cliente via manipulação de identificador
Quando eu faço login com a conta "clienteA@exemplo.com"
E eu tento acessar a URL restrita "/dados-do-cliente/id-do-cliente-B"
Então o sistema deve interceptar e bloquear a requisição
E eu devo ver a mensagem de erro "Acesso negado: Você não tem permissão para visualizar este recurso."

@cenario-de-excecao @seguranca
Cenário: Tentativa de acesso aos dados por entidade externa não autenticada
Quando eu acesso o sistema sem uma sessão de usuário ativa
E eu tento fazer uma consulta direta no endpoint "/api/clientes/informacoes"
Então o sistema deve rejeitar a comunicação imediatamente
E eu devo ver a mensagem de erro "401 Não Autorizado: Autenticação obrigatória."