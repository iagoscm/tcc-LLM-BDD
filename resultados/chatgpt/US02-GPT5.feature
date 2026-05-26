Feature: Busca com Autocomplete Acessível
Como um usuário de Tecnologia Assistiva (AT), eu quero poder pesquisar usando autocomplete
para encontrar e escolher um resultado correspondente de forma fácil e precisa.

Pré-condição:
Dado que eu estou em um campo de busca com funcionalidade de autocomplete habilitada

@caminho-feliz @smoke
Cenário: Exibir sugestões correspondentes durante a digitação
Quando eu digito o texto "Bra" no campo de busca
Então eu devo visualizar uma lista de sugestões correspondentes
E a sugestão "Brasil" deve estar disponível na lista

@caminho-feliz
Cenário: Navegar entre sugestões utilizando teclado
Quando eu digito o texto "Bra" no campo de busca
E eu pressiono a tecla "Seta para baixo"
Então a primeira sugestão deve estar selecionada
Quando eu pressiono novamente a tecla "Seta para baixo"
Então a próxima sugestão deve estar selecionada

@caminho-feliz
Cenário: Confirmar uma sugestão selecionada
Quando eu digito o texto "Bra" no campo de busca
E eu pressiono a tecla "Seta para baixo"
E eu pressiono a tecla "Enter"
Então a sugestão selecionada deve ser confirmada
E o valor confirmado deve preencher o campo de busca

@caminho-feliz
Cenário: Selecionar sugestão utilizando leitor de tela
Quando eu navego pelas sugestões utilizando tecnologia assistiva
Então a sugestão atualmente selecionada deve ser anunciada corretamente
E o estado da sugestão deve ser identificado como "selecionada"

@cenario-de-excecao
Cenário: Não exibir sugestões para termo sem correspondência
Quando eu digito o texto "XYZ123" no campo de busca
Então nenhuma sugestão deve ser exibida
E eu devo visualizar a mensagem "Nenhum resultado encontrado"

@cenario-de-excecao
Cenário: Não confirmar sugestão sem seleção explícita
Quando eu digito o texto "Bra" no campo de busca
E nenhuma sugestão foi navegada pelo usuário
Quando eu pressiono a tecla "Enter"
Então nenhuma sugestão deve ser confirmada
E o texto digitado deve permanecer no campo de busca

@cenario-de-excecao
Cenário: Não pré-selecionar sugestão automaticamente
Quando eu digito o texto "Bra" no campo de busca
Então nenhuma sugestão deve estar pré-selecionada automaticamente
E o usuário deve precisar navegar manualmente para selecionar uma sugestão

@caminho-feliz
Cenário: Fechar lista de sugestões utilizando teclado
Quando eu digito o texto "Bra" no campo de busca
E a lista de sugestões estiver visível
Quando eu pressiono a tecla "Esc"
Então a lista de sugestões deve ser fechada
E o foco deve permanecer no campo de busca