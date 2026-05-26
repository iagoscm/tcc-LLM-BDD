Feature: Alteração e redefinição segura de senha

Como um cliente de uma empresa de software, eu preciso da capacidade de alterar ou redefinir minha senha com segurança
para garantir que minha conta não seja comprometida por terceiros mal-intencionados.

Pré-condição:
Dado que eu possuo uma conta cadastrada no sistema
E que eu estou na página de autenticação

@caminho-feliz @smoke
Cenário: Alterar senha com credenciais válidas
Quando eu insiro minha senha atual "SenhaAtual123"
E eu insiro a nova senha "NovaSenha@123"
E eu confirmo a nova senha "NovaSenha@123"
E eu clico no botão "Salvar"
Então eu devo ver a mensagem "Senha alterada com sucesso."
E eu devo conseguir acessar o sistema utilizando a nova senha

@caminho-feliz
Cenário: Redefinir senha utilizando link válido enviado por email
Quando eu clico no link "Esqueci minha senha"
E eu insiro o email "cliente@exemplo.com"
E eu clico no botão "Enviar link de redefinição"
Então eu devo ver a mensagem "Um link para redefinição de senha foi enviado para seu email."

Quando eu acesso o link de redefinição recebido no email
E eu insiro a nova senha "NovaSenha@123"
E eu confirmo a nova senha "NovaSenha@123"
E eu clico no botão "Redefinir senha"
Então eu devo ver a mensagem "Senha redefinida com sucesso."
E eu devo conseguir acessar o sistema utilizando a nova senha

@cenario-de-excecao
Cenário: Tentativa de alterar senha informando senha atual incorreta
Quando eu insiro minha senha atual "SenhaIncorreta123"
E eu insiro a nova senha "NovaSenha@123"
E eu confirmo a nova senha "NovaSenha@123"
E eu clico no botão "Salvar"
Então eu devo ver a mensagem de erro "A senha atual informada é inválida."

@cenario-de-excecao
Cenário: Tentativa de redefinir senha com link expirado
Quando eu acesso um link de redefinição expirado
E eu insiro a nova senha "NovaSenha@123"
E eu confirmo a nova senha "NovaSenha@123"
E eu clico no botão "Redefinir senha"
Então eu devo ver a mensagem de erro "O link de redefinição de senha expirou."

@cenario-de-excecao
Cenário: Tentativa de redefinir senha com confirmação diferente
Quando eu acesso o link de redefinição recebido no email
E eu insiro a nova senha "NovaSenha@123"
E eu confirmo a nova senha "SenhaDiferente@123"
E eu clico no botão "Redefinir senha"
Então eu devo ver a mensagem de erro "As senhas informadas não coincidem."

@cenario-de-excecao
Cenário: Tentativa de cadastrar uma senha fora da política de segurança
Quando eu insiro minha senha atual "SenhaAtual123"
E eu insiro a nova senha "123"
E eu confirmo a nova senha "123"
E eu clico no botão "Salvar"
Então eu devo ver a mensagem de erro "A nova senha não atende aos requisitos de segurança."