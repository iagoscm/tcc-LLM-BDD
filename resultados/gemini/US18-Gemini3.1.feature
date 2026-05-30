Feature: Cálculo de 90% do ISI
Como um usuário, eu quero ver o valor calculado de 90% para o ISI
para que eu possa documentá-lo com precisão.

Pré-condição:
Dado que eu estou na página de cálculo do ISI

@caminho-feliz
Cenário: Cálculo e exibição correta do valor de 90% do ISI
Quando eu insiro o valor "200" no campo "Parâmetro ISI"
E eu clico no botão "Calcular"
Então eu devo ver o valor calculado "180" exibido claramente
E eu devo ver o parâmetro de entrada "Parâmetro ISI: 200" exibido ao lado do valor calculado

@cenario-de-excecao
Cenário: Tentativa de cálculo com parâmetro de entrada vazio
Quando eu deixo o campo "Parâmetro ISI" em branco
E eu clico no botão "Calcular"
Então eu devo ver a mensagem de erro "Por favor, insira um valor válido para calcular o ISI."

@cenario-de-excecao
Cenário: Tentativa de cálculo com formato de dado inválido
Quando eu insiro o valor "texto-invalido" no campo "Parâmetro ISI"
E eu clico no botão "Calcular"
Então eu devo ver a mensagem de erro "Apenas números são permitidos para o cálculo."