Feature: Controle de Autorização e Acesso
Como um cliente de uma empresa de software, eu quero que as contas só possam realizar ações ou acessar recursos que lhes foram explicitamente concedidos.

Pré-condição:
Dado que eu estou autenticado no sistema com a conta "cliente_padrao"

@caminho-feliz
Cenário: Acessar recurso com permissão explícita concedida
Quando eu navego para a página "/meus-relatorios"
E a minha conta possui a permissão "visualizar_relatorios"
Então eu devo visualizar o conteúdo da página "/meus-relatorios" com sucesso

@cenario-de-excecao
Cenário: Tentativa de acessar recurso sem permissão explícita
Quando eu tento acessar a página "/configuracoes-avancadas"
E a minha conta não possui a permissão "acessar_configuracoes_avancadas"
Então eu devo ser bloqueado de acessar a página
E eu devo ver a mensagem de erro "Acesso negado: Você não tem permissão para visualizar este recurso."

@cenario-de-excecao
Cenário: Tentativa de realizar ação sem permissão explícita
Quando eu clico no botão "Excluir Usuário"
E a minha conta não possui a permissão "excluir_usuarios"
Então a ação não deve ser executada
E eu devo ver a mensagem de erro "Operação não permitida: Privilégios insuficientes."