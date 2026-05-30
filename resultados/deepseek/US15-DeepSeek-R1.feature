Feature: Gerenciamento Seguro de Senha
  Como um cliente da empresa de software, eu preciso da capacidade de alterar ou redefinir minha senha de forma segura, sem me preocupar que minha(s) conta(s) possam ser sequestradas por terceiros mal-intencionados.

  Pré-condição:
    Dado que eu estou na página de login

  @caminho-feliz @smoke
  Cenário: Alteração de senha com credenciais válidas
    Quando eu faço login com email "cliente@exemplo.com" e senha "senhaAtual123"
    E eu acesso a página de alteração de senha
    E eu insiro a senha atual "senhaAtual123"
    E eu insiro a nova senha "NovaSenha@456"
    E eu confirmo a nova senha "NovaSenha@456"
    E eu clico no botão "Salvar"
    Então eu devo ver a mensagem "Senha alterada com sucesso."
    E eu devo conseguir fazer login com a nova senha

  @caminho-feliz
  Cenário: Redefinição de senha via e-mail
    Quando eu clico no link "Esqueci minha senha"
    E eu informo o e-mail "cliente@exemplo.com"
    E eu clico no botão "Enviar"
    Então eu devo ver a mensagem "Se o e-mail estiver cadastrado, você receberá um link de redefinição."
    E eu devo receber um e-mail com um link de redefinição válido
    Quando eu acesso o link de redefinição
    E eu insiro uma nova senha "NovaSenha@789"
    E eu confirmo a nova senha "NovaSenha@789"
    E eu clico no botão "Redefinir senha"
    Então eu devo ver a mensagem "Senha redefinida com sucesso."
    E eu devo conseguir fazer login com a nova senha

  @caminho-feliz
  Cenário: Encerramento de sessões ativas após alteração de senha
    Dado que eu estou logado em dois dispositivos com a conta "cliente@exemplo.com"
    Quando eu altero a senha em um dos dispositivos com sucesso
    Então a sessão no outro dispositivo deve ser invalidada
    E ao tentar acessar uma área restrita, o outro dispositivo deve ser redirecionado para a página de login

  @cenario-de-excecao
  Cenário: Alteração de senha com senha atual incorreta
    Quando eu faço login com email "cliente@exemplo.com" e senha "senhaAtual123"
    E eu acesso a página de alteração de senha
    E eu insiro a senha atual "senhaErrada"
    E eu insiro a nova senha "NovaSenha@456"
    E eu confirmo a nova senha "NovaSenha@456"
    E eu clico no botão "Salvar"
    Então eu devo ver a mensagem de erro "Senha atual incorreta."
    E a senha não deve ser alterada

  @cenario-de-excecao
  Cenário: Tentativa de redefinição de senha com e-mail não cadastrado
    Quando eu clico no link "Esqueci minha senha"
    E eu informo o e-mail "inexistente@exemplo.com"
    E eu clico no botão "Enviar"
    Então eu devo ver a mensagem "Se o e-mail estiver cadastrado, você receberá um link de redefinição."
    E eu não devo receber nenhum e-mail

  @cenario-de-excecao
  Cenário: Redefinição de senha com token expirado ou inválido
    Dado que um link de redefinição de senha foi enviado para "cliente@exemplo.com" há mais de 24 horas
    Quando eu acesso o link de redefinição expirado
    Então eu devo ver a mensagem de erro "Link de redefinição inválido ou expirado. Solicite um novo."

  @cenario-de-excecao
  Cenário: Redefinição de senha com confirmação de senha diferente
    Dado que eu recebi um link de redefinição de senha válido
    Quando eu acesso o link de redefinição
    E eu insiro uma nova senha "NovaSenha@123"
    E eu confirmo a nova senha "ConfirmacaoDiferente@123"
    E eu clico no botão "Redefinir senha"
    Então eu devo ver a mensagem de erro "As senhas não conferem."

  @cenario-de-excecao
  Cenário: Alteração de senha com nova senha fraca
    Quando eu faço login com email "cliente@exemplo.com" e senha "senhaAtual123"
    E eu acesso a página de alteração de senha
    E eu insiro a senha atual "senhaAtual123"
    E eu insiro a nova senha "123456"
    E eu confirmo a nova senha "123456"
    E eu clico no botão "Salvar"
    Então eu devo ver a mensagem de erro "A nova senha deve conter pelo menos 8 caracteres, incluindo letras maiúsculas, minúsculas, números e caracteres especiais."

  @cenario-de-excecao
  Cenário: Múltiplas tentativas de redefinição de senha em curto período
    Quando eu clico no link "Esqueci minha senha"
    E eu informo o e-mail "cliente@exemplo.com"
    E eu clico no botão "Enviar" 5 vezes em 10 minutos
    Então eu devo ver a mensagem de erro "Muitas solicitações. Tente novamente mais tarde."
    E não devem ser enviados novos e-mails de redefinição temporariamente