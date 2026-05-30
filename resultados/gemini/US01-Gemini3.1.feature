Feature: Detecção de PII Baseada em Contexto
Como um desenvolvedor ou engenheiro de privacidade de dados, eu quero um mecanismo que melhore a detecção de PII analisando o contexto textual ao redor de uma entidade, para que falsos positivos sejam reduzidos e correspondências fracas possam ser validadas.

Pré-condição:
Dado que o analisador do Microsoft Presidio está configurado e o mecanismo de contexto está ativado

@caminho-feliz
Cenário: Validação de correspondência fraca utilizando contexto de idade
Quando eu envio o texto "He just turned 6" para análise
E o sistema identifica a palavra de contexto "turned" próxima ao número "6"
Então a entidade "6" deve ser detectada como PII do tipo "Idade"
E a pontuação de confiança (confidence score) deve ser promovida para um nível alto

@caminho-feliz
Cenário: Validação de padrão de telefone utilizando contexto
Quando eu envio o texto "Please call my phone: 555-212-1234" para análise
E o sistema identifica a palavra de contexto "phone" próxima ao valor "555-212-1234"
Então a entidade "555-212-1234" deve ser detectada como PII do tipo "Número de Telefone"
E a detecção deve ser validada no resultado final

@cenario-de-excecao
Cenário: Rejeição de falso positivo para número sem contexto de telefone
Quando eu envio o texto "The product serial is 555-212-1234" para análise
E o sistema não encontra palavras de contexto relacionadas a telefone próximas ao valor "555-212-1234"
Então a entidade "555-212-1234" não deve ser classificada como "Número de Telefone"
E a detecção deve ser descartada do resultado final

@cenario-de-excecao
Cenário: Rejeição de falso positivo para dígito único sem contexto de idade
Quando eu envio o texto "I need to buy 6 apples for the pie" para análise
E o sistema não encontra palavras de contexto relacionadas a idade próximas ao número "6"
Então a entidade "6" não deve ser classificada como "Idade"
E o sistema deve ignorar o número como texto arbitrário