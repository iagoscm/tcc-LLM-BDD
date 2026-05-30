Feature: Cálculo do valor 90% do ISI
  Como um usuário, eu quero visualizar o valor calculado de 90% do ISI
  para que eu possa documentá-lo com precisão.
  O valor deve ser exibido claramente e os parâmetros de entrada
  devem aparecer ao lado do valor calculado.

  Pré-condição:
    Dado que eu estou na página de cálculo do ISI

  @caminho-feliz @smoke
  Cenário: Exibição do valor calculado com parâmetros de entrada válidos
    Quando eu insiro os valores de ISI "10, 12, 15, 20, 25, 30, 35, 40, 50, 100"
    E eu clico no botão "Calcular"
    Então eu devo ver o valor calculado "50 ms"
    E eu devo ver os parâmetros de entrada "Valores ISI: 10, 12, 15, 20, 25, 30, 35, 40, 50, 100" exibidos ao lado do valor

  @cenario-de-excecao
  Cenário: Tentativa de cálculo com campo vazio
    Quando eu deixo o campo de valores ISI vazio
    E eu clico no botão "Calcular"
    Então eu devo ver a mensagem de erro "É necessário informar ao menos um valor de ISI."

  @cenario-de-excecao
  Cenário: Tentativa de cálculo com valores inválidos
    Quando eu insiro os valores de ISI "10, abc, 20"
    E eu clico no botão "Calcular"
    Então eu devo ver a mensagem de erro "Formato inválido. Insira apenas números separados por vírgula."