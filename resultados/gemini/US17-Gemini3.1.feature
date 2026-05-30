Feature: Notificações de Inscrição
Como um usuário, eu quero receber notificações com base nas minhas inscrições
para que eu possa me manter atualizado sobre conteúdos e eventos relevantes.

Pré-condição:
Dado que eu estou autenticado no sistema

@caminho-feliz @smoke
Cenário: Recebimento de notificação de um conteúdo inscrito
Quando eu possuo uma inscrição ativa no canal "Notícias de Tecnologia"
E um novo artigo é publicado no canal "Notícias de Tecnologia"
Então eu devo receber uma notificação com o título "Novo artigo publicado"
E a notificação deve estar visível na minha central de alertas

@cenario-de-excecao
Cenário: Ausência de notificação para canais não inscritos
Quando eu não possuo inscrição no canal "Eventos Locais"
E um novo evento é publicado no canal "Eventos Locais"
Então eu não devo receber nenhuma notificação no meu dispositivo
E a minha central de alertas deve permanecer inalterada