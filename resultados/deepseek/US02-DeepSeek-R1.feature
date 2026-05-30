Feature: Autocomplete acessível para busca
  Como um usuário de tecnologia assistiva, eu quero poder pesquisar usando autocomplete, para que eu possa encontrar e escolher um resultado correspondente de forma fácil e precisa.

  Pré-condição:
    Dado que eu estou na página de busca com campo de autocomplete

  @caminho-feliz @smoke
  Cenário: Confirmar a primeira sugestão pré-selecionada com Enter
    Quando eu digito "car" no campo de busca
    Então eu devo ver uma lista de sugestões que correspondem a "car"
    E a primeira sugestão deve estar pré-selecionada
    Quando eu pressiono a tecla "Enter"
    Então a sugestão pré-selecionada deve ser confirmada
    E o campo de busca deve conter o texto da sugestão confirmada

  @caminho-feliz
  Cenário: Navegar entre as sugestões com as setas e confirmar a seleção
    Quando eu digito "ma" no campo de busca
    E eu devo ver uma lista de sugestões
    Quando eu pressiono a tecla "seta para baixo" duas vezes
    Então a terceira sugestão deve ficar selecionada
    E o leitor de tela deve anunciar a posição e o texto da sugestão selecionada
    Quando eu pressiono a tecla "Enter"
    Então a sugestão selecionada deve ser confirmada
    E o campo de busca deve exibir o texto da sugestão confirmada

  @cenario-de-excecao
  Cenário: Nenhuma correspondência encontrada
    Quando eu digito "zzzz" no campo de busca
    Então eu devo ver a mensagem "Nenhum resultado encontrado" na lista de sugestões
    E o leitor de tela deve anunciar que não há resultados

  @cenario-de-excecao
  Cenário: Fechar a lista de sugestões com a tecla Escape
    Quando eu digito "jo" no campo de busca
    E a lista de sugestões é exibida
    Quando eu pressiono a tecla "Escape"
    Então a lista de sugestões deve desaparecer
    E o texto "jo" deve permanecer no campo de busca