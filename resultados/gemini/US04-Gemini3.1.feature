Aqui estão os cenários de teste BDD em formato Gherkin para a sua História de Usuário, seguindo rigorosamente a estrutura e o estilo do exemplo fornecido.

Feature: Visualização do Resultado do Program Information Request (PIR)
Como um estudante ou usuário do ministério, eu quero visualizar o resultado de um Program Information Request (PIR) concluído dentro da aplicação associada, para que eu possa entender quais detalhes do programa e da oferta foram fornecidos pela instituição.

Pré-condição:
Dado que eu estou na página de detalhes da aplicação

@caminho-feliz
Cenário: Estudante visualiza os detalhes de um PIR concluído
Quando eu acesso uma aplicação que possui um PIR com o status "Concluído"
E eu navego até a seção de informações da instituição
Então eu devo visualizar os detalhes do programa fornecidos pela instituição
E eu devo visualizar os detalhes da oferta associada

@caminho-feliz
Cenário: Usuário do ministério visualiza os detalhes de um PIR concluído
Quando eu visualizo a aplicação do estudante como um usuário do ministério
E a aplicação possui um PIR com o status "Concluído"
Então eu devo visualizar todos os detalhes do programa e da oferta preenchidos pela instituição

@cenario-de-excecao
Cenário: Tentativa de visualizar detalhes de um PIR pendente
Quando eu acesso uma aplicação que possui um PIR com o status "Pendente"
E eu navego até a seção de informações da instituição
Então os campos de detalhes do programa e da oferta devem estar ocultos ou vazios
E eu devo ver a mensagem informativa "Aguardando informações do programa pela instituição."

@cenario-de-excecao
Cenário: Visualização de aplicação sem um PIR associado
Quando eu acesso uma aplicação que não requer uma solicitação de informações do programa (PIR)
Então a seção de Program Information Request não deve ser exibida na interface da aplicação