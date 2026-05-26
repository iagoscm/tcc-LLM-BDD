Feature: Visualização do resultado de uma Program Information Request (PIR)

Como um estudante ou usuário do ministério,
eu quero visualizar o resultado de uma Program Information Request (PIR) concluída dentro da aplicação associada,
para que eu possa entender quais detalhes de programa e oferta foram fornecidos pela instituição.

Pré-condição:
Dado que eu estou autenticado na aplicação
E que existe uma PIR concluída associada à minha aplicação

@caminho-feliz @smoke
Cenário: Visualizar o resultado de uma PIR concluída com sucesso
Quando eu acesso a seção de "Program Information Requests"
E eu seleciono uma PIR com status "Completed"
Então eu devo visualizar os detalhes do programa fornecidos pela instituição
E eu devo visualizar os detalhes da oferta relacionada
E eu devo visualizar a data de conclusão da PIR

@caminho-feliz
Cenário: Visualizar informações completas da oferta do programa
Quando eu acesso os detalhes de uma PIR concluída
Então eu devo visualizar o nome do programa
E eu devo visualizar o nome da instituição
E eu devo visualizar os detalhes da oferta acadêmica
E eu devo visualizar os requisitos ou informações adicionais fornecidas

@cenario-de-excecao
Cenário: Tentativa de visualizar uma PIR ainda não concluída
Quando eu acesso uma PIR com status "In Progress"
Então eu devo ver a mensagem "O resultado da PIR ainda não está disponível."

@cenario-de-excecao
Cenário: Tentativa de acessar uma PIR inexistente
Quando eu tento acessar uma PIR inválida
Então eu devo ver a mensagem de erro "Program Information Request não encontrada."

@cenario-de-excecao
Cenário: Usuário sem permissão para visualizar a PIR
Quando eu tento acessar uma PIR que não está associada à minha aplicação
Então eu devo ver a mensagem de erro "Você não possui permissão para visualizar esta Program Information Request."

@cenario-de-excecao
Cenário: Falha ao carregar os detalhes da PIR
Quando eu acesso uma PIR concluída
E ocorre uma falha no carregamento dos dados
Então eu devo ver a mensagem de erro "Não foi possível carregar os detalhes da Program Information Request."