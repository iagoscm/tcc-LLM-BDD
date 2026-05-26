Feature: Controle de Acesso Baseado em Permissões

Como um cliente de empresa de software, as contas devem ser capazes de executar apenas ações
ou acessar recursos explicitamente concedidos a elas.

Pré-condição:
Dado que o usuário está autenticado no sistema
E que existem permissões configuradas para a conta

@caminho-feliz @smoke
Cenário: Acesso permitido a um recurso autorizado
Quando o usuário tenta acessar o recurso "/relatorios"
E a conta possui permissão de acesso ao recurso
Então o sistema deve permitir o acesso ao recurso "/relatorios"

@caminho-feliz
Cenário: Execução permitida de uma ação autorizada
Quando o usuário tenta executar a ação "Criar Projeto"
E a conta possui permissão para executar a ação
Então o sistema deve executar a ação "Criar Projeto" com sucesso

@cenario-de-excecao
Cenário: Tentativa de acesso a recurso não autorizado
Quando o usuário tenta acessar o recurso "/admin"
E a conta não possui permissão de acesso ao recurso
Então o sistema deve bloquear o acesso ao recurso "/admin"
E eu devo ver a mensagem de erro "Acesso não autorizado."

@cenario-de-excecao
Cenário: Tentativa de execução de ação sem permissão
Quando o usuário tenta executar a ação "Excluir Usuário"
E a conta não possui permissão para executar a ação
Então o sistema não deve executar a ação "Excluir Usuário"
E eu devo ver a mensagem de erro "Permissão insuficiente para executar esta ação."

@cenario-de-excecao
Cenário: Tentativa de acesso com permissões removidas
Quando o usuário tenta acessar o recurso "/financeiro"
E a permissão de acesso foi removida da conta
Então o sistema deve bloquear o acesso ao recurso "/financeiro"
E eu devo ver a mensagem de erro "Acesso não autorizado."

@caminho-feliz
Cenário: Visualização apenas de funcionalidades permitidas
Quando o usuário acessa o menu principal do sistema
Então o sistema deve exibir apenas funcionalidades permitidas para a conta