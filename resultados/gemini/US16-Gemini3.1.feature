Feature: Seleção de Estações Meteorológicas
Como um Consultor ou membro da equipe BCWS, eu quero selecionar de 1 a 3 estações meteorológicas para que eu possa obter dados relevantes para o local que estou inspecionando ou aplicação que estou revisando.

Pré-condição:
Dado que eu estou na página de seleção de estações meteorológicas

@caminho-feliz
Cenário: Selecionar exatamente uma estação meteorológica
Quando eu seleciono a estação meteorológica "Estação Vancouver"
E eu clico no botão "Buscar Dados"
Então eu devo ver os dados meteorológicos relevantes para a "Estação Vancouver"

@caminho-feliz
Cenário: Selecionar o limite máximo de três estações meteorológicas
Quando eu seleciono a estação meteorológica "Estação Vancouver"
E eu seleciono a estação meteorológica "Estação Victoria"
E eu seleciono a estação meteorológica "Estação Kamloops"
E eu clico no botão "Buscar Dados"
Então eu devo ver os dados meteorológicos relevantes combinados para as três estações selecionadas

@cenario-de-excecao
Cenário: Tentativa de busca sem selecionar nenhuma estação
Quando eu não seleciono nenhuma estação meteorológica
E eu clico no botão "Buscar Dados"
Então eu devo ver a mensagem de erro "Por favor, selecione pelo menos 1 estação meteorológica."

@cenario-de-excecao
Cenário: Tentativa de selecionar mais de três estações
Quando eu já selecionei 3 estações meteorológicas
E eu tento selecionar a estação meteorológica "Estação Kelowna"
Então a seleção deve ser bloqueada
E eu devo ver a mensagem de erro "Você pode selecionar no máximo 3 estações meteorológicas."