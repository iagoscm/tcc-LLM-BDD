Feature: Coleta de Logs para Ferramentas de Segurança

Como um cliente de empresa de software, eu quero a capacidade de coletar logs em um formato padrão para um SIEM ou outra ferramenta de segurança, contendo informações de acesso de usuários e administradores, mas sem informações sensíveis como senhas ou PII.

Pré-condição:
Dado que o sistema de auditoria e geração de logs está habilitado
E que existe uma integração configurada com uma ferramenta SIEM

@caminho-feliz @smoke
Cenário: Registrar acesso de usuário em formato padrão
Quando um usuário realiza login com credenciais válidas
Então um log deve ser gerado no formato padrão configurado
E o log deve conter o identificador do usuário
E o log deve conter a data e hora do acesso
E o log deve conter o tipo de ação "LOGIN"
E o log não deve conter senha do usuário
E o log não deve conter informações PII

@caminho-feliz
Cenário: Registrar acesso administrativo no sistema
Quando um administrador acessa o painel administrativo
Então um log deve ser gerado no formato padrão configurado
E o log deve conter o identificador do administrador
E o log deve conter a ação "ACESSO_ADMINISTRATIVO"
E o log deve conter a data e hora do acesso
E o log não deve conter senha do administrador
E o log não deve conter informações PII

@caminho-feliz
Cenário: Exportar logs para ferramenta SIEM
Quando o sistema envia logs para a ferramenta SIEM integrada
Então os logs devem ser transmitidos com sucesso
E os logs devem estar no formato padrão suportado
E os logs devem conter informações de eventos de acesso
E os logs não devem conter senhas
E os logs não devem conter informações PII

@cenario-de-excecao
Cenário: Tentativa de registrar senha em log
Quando ocorre uma tentativa de autenticação de usuário
E o sistema processa os dados de login
Então a senha informada não deve ser registrada no log
E o sistema deve mascarar qualquer dado sensível relacionado à autenticação

@cenario-de-excecao
Cenário: Tentativa de registrar informações PII em log
Quando um evento de acesso contém informações pessoais identificáveis
Então o sistema deve remover ou mascarar os dados PII antes de gerar o log
E o log deve ser armazenado sem informações sensíveis

@cenario-de-excecao
Cenário: Falha na integração com ferramenta SIEM
Quando o sistema tenta enviar logs para a ferramenta SIEM
E a ferramenta SIEM está indisponível
Então o sistema deve registrar uma falha de integração
E os logs devem permanecer armazenados localmente para reenvio posterior