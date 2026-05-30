Feature: Seleção de Estações Meteorológicas
  Como um Consultor ou membro da equipe BCWS, eu quero selecionar de 1 a 3 estações meteorológicas
  para obter dados relevantes à localização que estou inspecionando ou aplicação que estou revisando.

  Pré-condição:
    Dado que eu estou na página de seleção de estações meteorológicas

  @caminho-feliz @smoke
  Cenário: Selecionar uma estação meteorológica
    Quando eu seleciono a estação "Estação Central"
    E eu clico no botão "Obter Dados"
    Então eu devo visualizar os dados meteorológicos da estação "Estação Central"

  @caminho-feliz
  Cenário: Selecionar duas estações meteorológicas
    Quando eu seleciono a estação "Estação Norte"
    E eu seleciono a estação "Estação Sul"
    E eu clico no botão "Obter Dados"
    Então eu devo visualizar os dados meteorológicos das estações "Estação Norte" e "Estação Sul"

  @caminho-feliz
  Cenário: Selecionar três estações meteorológicas
    Quando eu seleciono a estação "Estação Litorânea"
    E eu seleciono a estação "Estação Montanha"
    E eu seleciono a estação "Estação Vale"
    E eu clico no botão "Obter Dados"
    Então eu devo visualizar os dados meteorológicos das estações "Estação Litorânea", "Estação Montanha" e "Estação Vale"

  @cenario-de-excecao
  Cenário: Tentar obter dados sem selecionar nenhuma estação
    Quando eu não seleciono nenhuma estação meteorológica
    E eu clico no botão "Obter Dados"
    Então eu devo ver a mensagem "Selecione pelo menos uma estação meteorológica."

  @cenario-de-excecao
  Cenário: Exceder o limite máximo de estações
    Dado que eu selecionei as estações "Estação A", "Estação B" e "Estação C"
    Quando eu tento selecionar a estação "Estação D"
    Então eu devo ver a mensagem "Limite máximo de 3 estações atingido."
    E a estação "Estação D" não deve estar selecionada