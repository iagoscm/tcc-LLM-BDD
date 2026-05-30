Feature: Coleta de Logs de Segurança
Como um cliente de uma empresa de software, eu quero poder coletar logs em um formato padrão para um SIEM ou outra ferramenta de segurança, contendo informações de acesso, mas omitindo dados sensíveis como senhas e PII.

Pré-condição:
Dado que a integração de envio de logs para o SIEM está ativa no sistema

@caminho-feliz
Cenário: Registro de log de acesso padrão e administrativo
Quando um usuário comum ou administrador realiza um acesso no sistema
E o sistema gera o log desse evento
Então o log exportado deve estar estruturado em um formato padrão legível
E deve conter os detalhes do acesso realizado

@cenario-de-excecao
Cenário: Bloqueio de senhas na exportação de logs
Quando um usuário tenta realizar uma ação informando a senha "MinhaSenha123"
E o sistema gera o log para a ferramenta de segurança
Então o arquivo de log gerado não deve conter a informação "MinhaSenha123"
E o campo da senha deve ser suprimido ou completamente mascarado

@cenario-de-excecao
Cenário: Bloqueio de Informações Pessoalmente Identificáveis (PII)
Quando um administrador acessa um perfil contendo o CPF "123.456.789-00" e o cartão de crédito do cliente
E o sistema processa a coleta desse log
Então os dados como CPF e cartão de crédito não devem ser exportados em texto limpo
E essas informações PII devem ser previamente filtradas dos logs do SIEM