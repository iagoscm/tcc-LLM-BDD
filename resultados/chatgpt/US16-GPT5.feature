Feature: Seleção de Estações Meteorológicas

Como um Consultant ou membro da BCWS, eu quero selecionar de 1 a 3 estações meteorológicas para obter dados relevantes à localização que estou avaliando/analisando.

Pré-condição:
Dado que eu estou na página de seleção de estações meteorológicas
E que existem estações meteorológicas disponíveis para seleção

@caminho-feliz @smoke
Cenário: Selecionar uma única estação meteorológica
Quando eu seleciono a estação meteorológica "Station A"
E eu clico no botão "Confirmar"
Então a estação meteorológica "Station A" deve ser associada à minha análise
E eu devo visualizar os dados da estação selecionada

@caminho-feliz
Cenário: Selecionar três estações meteorológicas
Quando eu seleciono a estação meteorológica "Station A"
E eu seleciono a estação meteorológica "Station B"
E eu seleciono a estação meteorológica "Station C"
E eu clico no botão "Confirmar"
Então as estações meteorológicas "Station A", "Station B" e "Station C" devem ser associadas à minha análise
E eu devo visualizar os dados das estações selecionadas

@cenario-de-excecao
Cenário: Tentar confirmar sem selecionar nenhuma estação meteorológica
Quando eu clico no botão "Confirmar" sem selecionar nenhuma estação
Então eu devo ver a mensagem de erro "Selecione pelo menos uma estação meteorológica."

@cenario-de-excecao
Cenário: Tentar selecionar mais de três estações meteorológicas
Quando eu seleciono a estação meteorológica "Station A"
E eu seleciono a estação meteorológica "Station B"
E eu seleciono a estação meteorológica "Station C"
E eu tento selecionar a estação meteorológica "Station D"
Então eu devo ver a mensagem de erro "É permitido selecionar no máximo 3 estações meteorológicas."
E a estação meteorológica "Station D" não deve ser selecionada

@cenario-de-excecao
Cenário: Estação meteorológica indisponível para seleção
Quando eu tento selecionar a estação meteorológica "Station X" indisponível
Então eu devo ver a mensagem de erro "A estação meteorológica selecionada não está disponível."