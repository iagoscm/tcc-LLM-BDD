Feature: Controle de Acesso e Autorização
Como um cliente de uma empresa de software, eu quero que as contas só possam realizar ações ou acessar recursos que lhes foram explicitamente concedidos para garantir a segurança do sistema.

Pré-condição:
Dado que eu estou autenticado no sistema com minha conta de cliente

@caminho-feliz
Cenário: Acesso a recurso com permissão explícita
Quando eu tento acessar a página "/meus-projetos"
E a minha conta possui a permissão "acessar_projetos"
Então eu devo ser redirecionado para a página "/meus-projetos"

@cenario-de-excecao
Cenário: Tentativa de acesso a recurso sem permissão
Quando eu tento acessar a página "/configuracoes-globais"
E a minha conta não possui a permissão "acessar_configuracoes_globais"
Então o acesso deve ser bloqueado
E eu devo ver a mensagem de erro "Acesso negado. Você não tem permissão para visualizar esta página."

@cenario-de-excecao
Cenário: Tentativa de execução de ação sem permissão explícita
Quando eu clico no botão "Excluir Serviço"
E a minha conta não possui a permissão "excluir_recursos"
Então a exclusão não deve ser realizada
E eu devo ver a mensagem de erro "Ação não autorizada."