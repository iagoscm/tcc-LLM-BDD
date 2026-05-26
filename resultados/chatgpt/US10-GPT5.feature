Feature: Controle de Acesso Baseado em Permissões

Como um cliente de uma empresa de software, as contas devem
ser capazes de executar apenas as ações ou acessar os recursos
explicitamente concedidos a elas.

Pré-condição:
Dado que o usuário está autenticado no sistema
E que existem permissões configuradas para sua conta

@caminho-feliz @smoke
Cenário: Usuário acessa recurso permitido
Quando o usuário tenta acessar o recurso "/relatorios"
E a permissão de acesso ao recurso foi concedida
Então o sistema deve permitir o acesso ao recurso "/relatorios"

@caminho-feliz
Cenário: Usuário executa ação autorizada
Quando o usuário tenta executar a ação "criar projeto"
E a permissão para executar a ação foi concedida
Então o sistema deve executar a ação com sucesso

@cenario-de-excecao
Cenário: Usuário tenta acessar recurso sem permissão
Quando o usuário tenta acessar o recurso "/configuracoes"
E a permissão de acesso ao recurso não foi concedida
Então o sistema deve negar o acesso ao recurso "/configuracoes"
E o sistema deve exibir a mensagem "Acesso não autorizado."

@cenario-de-excecao
Cenário: Usuário tenta executar ação não autorizada
Quando o usuário tenta executar a ação "excluir usuário"
E a permissão para executar a ação não foi concedida
Então o sistema deve impedir a execução da ação
E o sistema deve exibir a mensagem "Você não possui permissão para esta ação."

@cenario-de-excecao
Cenário: Usuário autenticado tenta acessar recurso restrito de administrador
Quando o usuário tenta acessar o recurso "/admin"
E o usuário não possui perfil de administrador
Então o sistema deve negar o acesso ao recurso "/admin"
E o sistema deve exibir a mensagem "Acesso restrito."

@caminho-feliz
Cenário: Administrador acessa recurso administrativo permitido
Quando o usuário tenta acessar o recurso "/admin"
E o usuário possui perfil de administrador
Então o sistema deve permitir o acesso ao recurso "/admin"