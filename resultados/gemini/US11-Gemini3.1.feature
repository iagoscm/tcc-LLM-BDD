Feature: Gerenciamento Seguro de Sessão
Como um cliente de uma empresa de software, eu quero que as sessões da aplicação sejam únicas e resistentes a sequestro por um ator malicioso para garantir a segurança da minha conta.

Pré-condição:
Dado que eu possuo uma conta de cliente no sistema

@caminho-feliz
Cenário: Criação de sessão única e encerramento de sessões anteriores
Quando eu insiro minhas credenciais na página de login
E eu clico no botão "Entrar"
Então o sistema deve gerar um identificador de sessão único atrelado ao meu dispositivo atual
E qualquer outra sessão ativa previamente associada à minha conta deve ser invalidada

@cenario-de-excecao
Cenário: Tentativa de sequestro de sessão através de mudança de contexto
Quando um ator malicioso tenta acessar a aplicação utilizando meu identificador de sessão válido
E a requisição se origina de um endereço IP ou "User-Agent" diferente da sessão original
Então o sistema deve rejeitar o acesso imediatamente
E o identificador de sessão atual deve ser revogado
E o sistema deve exibir a mensagem de erro "Sessão inválida ou comprometida. Faça o login novamente."