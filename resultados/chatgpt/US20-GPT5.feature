Feature: Atualização de Informações de Contato do Estudante

Como um estudante, eu quero atualizar minhas informações de contato
para garantir que meu endereço e número de telefone estejam atualizados.

Pré-condição:
Dado que eu estou autenticado no sistema
E eu estou na página de informações do estudante

@caminho-feliz @smoke
Cenário: Atualizar endereço residencial com sucesso
Quando eu altero o endereço para "123 Main Street, Vancouver"
E eu clico no botão "Salvar"
Então eu devo ver a mensagem "Informações atualizadas com sucesso."
E o novo endereço deve ser exibido nas informações do estudante

@caminho-feliz
Cenário: Atualizar número de telefone com sucesso
Quando eu altero o número de telefone para "(604) 555-1234"
E eu clico no botão "Salvar"
Então eu devo ver a mensagem "Informações atualizadas com sucesso."
E o novo número de telefone deve ser exibido nas informações do estudante

@cenario-de-excecao
Cenário: Tentativa de alterar informações sincronizadas do BCSC
Quando eu tento editar o campo "Primeiro Nome"
Então o campo deve estar desabilitado
E eu devo ver a mensagem "Para alterar esta informação, acesse o ICBC."

@cenario-de-excecao
Cenário: Tentativa de alterar data de nascimento sincronizada do BCSC
Quando eu tento editar o campo "Data de Nascimento"
Então o campo deve estar desabilitado
E eu devo ver a mensagem "Para alterar esta informação, acesse o ICBC."

@cenario-de-excecao
Cenário: Tentativa de alterar email sincronizado do BCSC
Quando eu tento editar o campo "Email"
Então o campo deve estar desabilitado
E eu devo ver a mensagem "Para alterar esta informação, acesse o ICBC."

@cenario-de-excecao
Cenário: Tentativa de visualizar o número do SIN
Quando eu acesso a página de informações do estudante
Então o campo "SIN" não deve ser exibido

@cenario-de-excecao
Cenário: Tentativa de atualizar o número do SIN
Quando eu tento localizar o campo "SIN" para edição
Então o campo "SIN" não deve estar disponível para atualização

@caminho-feliz
Cenário: Visualizar campos de informações pessoais como somente leitura
Quando eu visualizo as informações pessoais do estudante
Então os campos "Primeiro Nome", "Nome do Meio", "Sobrenome", "Data de Nascimento", "Email" e "Gênero" devem estar como somente leitura