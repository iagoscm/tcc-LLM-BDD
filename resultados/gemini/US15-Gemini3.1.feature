Feature: Recuperação e Alteração de Senha
Como um cliente da empresa de software, eu quero poder alterar ou redefinir minha senha de forma segura para garantir que minha conta não seja invadida por terceiros.

Pré-condição:
Dado que eu estou logado no sistema ou na página de recuperação de senha

@caminho-feliz
Cenário: Alteração de senha com sucesso
Quando eu navego para a seção de "Configurações de Segurança"
E eu insiro minha senha atual "SenhaAtual123"
E eu insiro a nova senha "NovaSenhaSegura456!"
E eu confirmo a nova senha "NovaSenhaSegura456!"
E eu clico no botão "Salvar nova senha"
Então eu devo ver a mensagem de confirmação "Senha alterada com sucesso."

@caminho-feliz
Cenário: Solicitação de reset de senha via email
Quando eu navego para a página de "Esqueci minha senha"
E eu insiro o email "cliente@exemplo.com"
E eu clico no botão "Enviar link de recuperação"
Então eu devo ver a mensagem "Um link de redefinição foi enviado para o seu email."

@cenario-de-excecao
Cenário: Alteração de senha com confirmação incorreta
Quando eu navego para a seção de "Configurações de Segurança"
E eu insiro minha senha atual "SenhaAtual123"
E eu insiro a nova senha "NovaSenhaSegura456!"
E eu confirmo a nova senha "SenhaDiferente789"
E eu clico no botão "Salvar nova senha"
Então eu devo ver a mensagem de erro "As senhas não coincidem."

@cenario-de-excecao
Cenário: Solicitação de reset para email inexistente
Quando eu navego para a página de "Esqueci minha senha"
E eu insiro o email "nao-cadastrado@exemplo.com"
E eu clico no botão "Enviar link de recuperação"
Então eu devo ver a mensagem de erro "Email não encontrado em nossa base de dados."