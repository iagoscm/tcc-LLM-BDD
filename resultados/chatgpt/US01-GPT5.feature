Feature: Validação de PII com análise contextual

Como um developer ou data privacy engineer utilizando o Microsoft Presidio, eu quero um mecanismo que aprimore a detecção de PII através da análise do contexto textual ao redor de uma entidade detectada, para que falsos positivos sejam reduzidos e correspondências fracas possam ser validadas utilizando pistas linguísticas, significado semântico ou machine learning leve.

Pré-condição:
Dado que o mecanismo de análise contextual está habilitado no sistema
E que o texto submetido será analisado por regex e contexto linguístico

@caminho-feliz @smoke
Cenário: Validar número de telefone com palavras de contexto próximas
Quando o texto "Meu phone number é 555-212-1234" for analisado
Então a entidade "555-212-1234" deve ser classificada como "PHONE_NUMBER"
E a confiança da detecção deve ser aumentada devido ao contexto "phone number"

@caminho-feliz
Cenário: Validar idade com contexto semântico
Quando o texto "He just turned 6 yesterday" for analisado
Então a entidade "6" deve ser classificada como "AGE"
E a confiança da detecção deve ser aumentada devido ao contexto "turned"

@caminho-feliz
Cenário: Promover detecção fraca de cartão de crédito com contexto financeiro
Quando o texto "Use this credit card 4111-1111-1111-1111 for payment" for analisado
Então a entidade "4111-1111-1111-1111" deve ser classificada como "CREDIT_CARD"
E a confiança da detecção deve ser aumentada devido ao contexto "credit card"

@caminho-feliz
Cenário: Identificar CEP utilizando palavras de endereço próximas
Quando o texto "The ZIP code is 90210" for analisado
Então a entidade "90210" deve ser classificada como "ZIP_CODE"
E a confiança da detecção deve ser aumentada devido ao contexto "ZIP code"

@cenario-de-excecao
Cenário: Ignorar número de telefone sem contexto relevante
Quando o texto "555-212-1234 was generated randomly" for analisado
Então a entidade "555-212-1234" não deve ser classificada como "PHONE_NUMBER"
E a confiança da detecção deve permanecer baixa

@cenario-de-excecao
Cenário: Ignorar número isolado sem indicação de idade
Quando o texto "I have 6 apples on the table" for analisado
Então a entidade "6" não deve ser classificada como "AGE"
E nenhuma promoção contextual deve ocorrer

@cenario-de-excecao
Cenário: Não promover entidade quando contexto contradiz o padrão
Quando o texto "The sequence 4111-1111-1111-1111 is only an example" for analisado
Então a entidade "4111-1111-1111-1111" deve possuir baixa confiança de classificação
E o sistema não deve promovê-la automaticamente para "CREDIT_CARD"

@cenario-de-excecao
Cenário: Não classificar código numérico genérico como CEP
Quando o texto "The product identifier is 90210" for analisado
Então a entidade "90210" não deve ser classificada como "ZIP_CODE"
E nenhuma promoção contextual deve ocorrer