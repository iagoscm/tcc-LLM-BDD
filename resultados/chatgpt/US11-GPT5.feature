Feature: Segurança e Unicidade de Sessão de Aplicação

Como um cliente de empresa de software, eu quero que as sessões da aplicação sejam únicas e resistentes a sequestro
para garantir acesso seguro à minha conta e aos meus dados.

Pré-condição:
Dado que o usuário possui uma conta válida no sistema
E que o usuário está na página de autenticação

@caminho-feliz @smoke
Cenário: Criação de sessão única após autenticação válida
Quando o usuário insere o email "[cliente@empresa.com](mailto:cliente@empresa.com)"
E o usuário insere a senha "SenhaSegura123"
E o usuário clica no botão "Entrar"
Então o sistema deve criar uma sessão única para o usuário
E o identificador da sessão deve ser criptograficamente seguro
E o usuário deve ser redirecionado para a página "/dashboard"

@caminho-feliz
Cenário: Renovação do identificador de sessão após novo login
Dado que o usuário possui uma sessão ativa válida
Quando o usuário realiza logout do sistema
E o usuário realiza um novo login com credenciais válidas
Então o sistema deve gerar um novo identificador de sessão
E o novo identificador de sessão deve ser diferente da sessão anterior

@caminho-feliz
Cenário: Invalidação da sessão após logout
Dado que o usuário está autenticado no sistema
Quando o usuário clica no botão "Sair"
Então a sessão atual deve ser invalidada
E o usuário não deve conseguir reutilizar o identificador da sessão anterior

@cenario-de-excecao
Cenário: Tentativa de reutilização de sessão expirada
Dado que a sessão do usuário expirou por inatividade
Quando uma requisição é enviada utilizando o identificador da sessão expirada
Então o sistema deve rejeitar a requisição
E o usuário deve ver a mensagem "Sessão expirada. Faça login novamente."

@cenario-de-excecao
Cenário: Tentativa de acesso com identificador de sessão inválido
Quando uma requisição é enviada com um identificador de sessão inválido
Então o sistema deve bloquear o acesso à aplicação
E o usuário deve ver a mensagem "Sessão inválida."

@cenario-de-excecao
Cenário: Tentativa de hijacking utilizando sessão de outro usuário
Dado que existe uma sessão ativa associada ao usuário "[clienteA@empresa.com](mailto:clienteA@empresa.com)"
Quando um agente malicioso tenta reutilizar o identificador da sessão em outro dispositivo
Então o sistema deve detectar a tentativa de uso suspeito
E o sistema deve invalidar a sessão comprometida
E o usuário deve ver a mensagem "Atividade suspeita detectada. Faça login novamente."
