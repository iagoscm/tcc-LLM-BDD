Feature: Notificações por Assinaturas e Exibição do Valor ISI 90%

Como um usuário, eu quero receber notificações com base nas minhas assinaturas
para que eu possa me manter atualizado sobre conteúdos e eventos relevantes.

Como um usuário, eu quero visualizar o valor calculado de 90% para ISI
para que eu possa documentá-lo corretamente.

Pré-condição:
Dado que eu estou autenticado no sistema
E possuo assinaturas ativas configuradas
E estou na página de visualização de ISI

@caminho-feliz @smoke
Cenário: Receber notificação baseada em assinatura ativa
Quando um novo conteúdo relacionado à minha assinatura for publicado
Então eu devo receber uma notificação sobre o novo conteúdo
E a notificação deve conter o título do conteúdo publicado
E a notificação deve exibir a data do evento ou publicação

@caminho-feliz
Cenário: Visualizar o valor calculado de 90% para ISI
Quando eu acessar os detalhes do cálculo ISI
Então eu devo visualizar o valor calculado de 90% para ISI
E os parâmetros de entrada utilizados no cálculo devem ser exibidos ao lado do valor calculado

@caminho-feliz
Cenário: Exibir claramente o valor calculado de ISI
Quando o cálculo de ISI for concluído
Então o valor de 90% para ISI deve ser exibido de forma clara e destacada
E o usuário deve conseguir identificar facilmente os parâmetros utilizados no cálculo

@cenario-de-excecao
Cenário: Usuário sem assinaturas ativas não recebe notificações
Quando um novo conteúdo for publicado
Então eu não devo receber notificações relacionadas ao conteúdo

@cenario-de-excecao
Cenário: Falha ao calcular o valor de 90% para ISI
Quando ocorrer um erro no processamento do cálculo ISI
Então eu devo visualizar a mensagem de erro "Não foi possível calcular o valor de ISI."
E nenhum valor calculado deve ser exibido

@cenario-de-excecao
Cenário: Parâmetros de entrada indisponíveis para o cálculo ISI
Quando eu acessar os detalhes do cálculo ISI
E os parâmetros de entrada não estiverem disponíveis
Então eu devo visualizar a mensagem "Parâmetros de entrada indisponíveis."
E o valor calculado não deve ser apresentado