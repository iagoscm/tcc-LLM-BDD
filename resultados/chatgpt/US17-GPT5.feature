Feature: Notificações Baseadas em Assinaturas
Como um usuário, eu quero receber notificações com base nas minhas assinaturas
para que eu possa me manter atualizado sobre conteúdos e eventos relevantes.

Pré-condição:
Dado que eu estou autenticado no sistema
E que eu possuo assinaturas ativas de conteúdos ou eventos

@caminho-feliz @smoke
Cenário: Receber notificação de novo conteúdo relacionado à assinatura
Quando um novo conteúdo relacionado à minha assinatura for publicado
Então eu devo receber uma notificação sobre o novo conteúdo

@caminho-feliz
Cenário: Receber notificação de evento relacionado à assinatura
Quando um novo evento relacionado à minha assinatura for criado
Então eu devo receber uma notificação sobre o evento

@caminho-feliz
Cenário: Visualizar lista de notificações recebidas
Quando eu acessar a área de notificações
Então eu devo visualizar todas as notificações recebidas relacionadas às minhas assinaturas

@cenario-de-excecao
Cenário: Não receber notificação para conteúdo fora da assinatura
Quando um novo conteúdo não relacionado às minhas assinaturas for publicado
Então eu não devo receber nenhuma notificação sobre esse conteúdo

@cenario-de-excecao
Cenário: Tentativa de envio de notificação para usuário sem assinatura ativa
Quando um novo conteúdo relacionado for publicado
E o usuário não possuir assinatura ativa
Então nenhuma notificação deve ser enviada ao usuário

@cenario-de-excecao
Cenário: Falha no envio de notificação
Quando ocorrer uma falha no serviço de notificações
Então o sistema deve registrar o erro de envio
E eu não devo receber notificações duplicadas após a recuperação do serviço