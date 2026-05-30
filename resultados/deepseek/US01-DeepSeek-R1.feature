Feature: Aprimoramento da Detecção de PII com Análise de Contexto

Como um developer ou engenheiro de privacidade de dados usando o Microsoft Presidio,
eu quero um mecanismo que aprimore a detecção de PII analisando o contexto textual ao redor de uma entidade detectada,
para que falsos positivos sejam reduzidos e correspondências fracas possam ser validadas ou promovidas usando pistas linguísticas, como palavras-chave próximas, significado semântico ou aprendizado de máquina leve.

Pré-condição:
Dado que o sistema Presidio está configurado com um mecanismo de análise de contexto ativo
E que um texto contendo uma possível entidade PII foi submetido para análise

@caminho-feliz @smoke
Cenário: Promoção de correspondência fraca de telefone devido a palavras-chave de contexto próximas
Quando o texto analisado contém "555-212-1234"
E a substring "phone number" está presente nas proximidades (até 5 palavras de distância)
E a entidade detectada tem baixa confiança pelo reconhecedor regex isolado
Então o mecanismo de contexto deve aumentar a confiança da entidade
E a entidade "555-212-1234" deve ser classificada como "PHONE_NUMBER"

@caminho-feliz
Cenário: Validação de idade ambígua usando significado semântico
Quando o texto analisado contém "He just turned 6"
E não há indicadores explícitos de idade como "years old"
E o contexto semântico indica referência temporal de envelhecimento
Então o número "6" deve ser detectado como "AGE"
E a confiança da detecção deve ser superior ao limiar padrão

@caminho-feliz
Cenário: Redução de falso positivo para formato de data sem contexto
Quando o texto analisado contém "12-05-2023" isolado
E não há palavras-chave como "birth", "date", "expiration" nas proximidades
E o contexto geral não sugere referência a datas pessoais
Então o mecanismo deve reduzir a confiança ou suprimir a detecção de "DATE_OF_BIRTH"
E o resultado deve ser marcado como "baixa relevância para PII"

@cenario-de-excecao
Cenário: Contexto conflitante causa rejeição da entidade
Quando o texto analisado contém "555-212-1234"
E a palavra "fax" está nas proximidades
E a palavra "phone" está ausente no contexto
Então o mecanismo não deve promover a entidade como "PHONE_NUMBER"
E a confiança deve permanecer abaixo do limiar de aceitação para PII

@cenario-de-excecao
Cenário: Ausência de modelo de ML leve quando necessário
Dado que o mecanismo de contexto está configurado apenas para palavras-chave
Quando o texto analisado contém "He just turned 6"
E não há palavras-chave como "years old" ou "age"
E o modelo semântico leve não está disponível
Então o número "6" não deve ser classificado como "AGE"
E um log de aviso deve ser gerado indicando "Contexto semântico não disponível"

@cenario-de-excecao
Cenário: Contexto muito distante da entidade
Quando o texto analisado contém "My number is 555-212-1234. Please call me later."
E a palavra-chave "phone" está a mais de 10 palavras de distância do número
E o limiar de proximidade configurado é de 5 palavras
Então a entidade não deve ser promovida a "PHONE_NUMBER"
E a detecção deve ser tratada como correspondência fraca não validada