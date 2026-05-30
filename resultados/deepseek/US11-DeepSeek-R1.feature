Feature: Proteção Contra Sequestro de Sessão
  Como um cliente da empresa de software, eu quero que as sessões da aplicação sejam únicas e resistentes a sequestro por atores maliciosos, para garantir que apenas eu possa acessar minha conta de forma segura.

Pré-condição:
  Dado que eu estou autenticado no sistema com o email "cliente@software.com"

@caminho-feliz @smoke
Cenário: Geração de nova sessão a cada autenticação
  Quando eu clico no botão "Sair"
  E eu insiro o email "cliente@software.com"
  E eu insiro a senha "senhaSegura123"
  E eu clico no botão "Entrar"
  Então eu devo ser redirecionado para a página "/painel"
  E o valor do cookie de sessão deve ser diferente do anterior

@cenario-de-excecao
Cenário: Sessão invalidada ao detectar alteração de endereço IP
  Quando eu acesso a página "/painel" a partir de um novo endereço IP público utilizando o cookie de sessão atual
  Então eu devo ser redirecionado para a página de login
  E a mensagem "Sessão encerrada por segurança. Faça login novamente." deve ser exibida