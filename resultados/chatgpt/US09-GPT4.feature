Feature: Proteção de Dados de Clientes

Como um cliente de uma empresa de software, eu quero que meus dados sejam protegidos
contra divulgação não intencional para outros clientes ou partes externas.

Pré-condição:
Dado que eu estou autenticado no sistema com uma conta válida
E que existem dados cadastrados pertencentes a diferentes clientes

@caminho-feliz @smoke
Cenário: Cliente acessa apenas seus próprios dados
Quando eu acesso a área de gerenciamento de dados
Então eu devo visualizar apenas os dados pertencentes à minha conta
E eu não devo visualizar dados de outros clientes

@caminho-feliz
Cenário: Compartilhamento de dados autorizado entre usuários da mesma organização
Quando um usuário da mesma organização acessa os dados compartilhados
Então ele deve conseguir visualizar apenas os dados autorizados para sua organização
E os dados de outras organizações não devem estar disponíveis

@cenario-de-excecao
Cenário: Tentativa de acesso direto aos dados de outro cliente
Quando eu altero manualmente o identificador do cliente na URL da requisição
Então o sistema deve bloquear o acesso aos dados
E eu devo ver a mensagem de erro "Acesso não autorizado."

@cenario-de-excecao
Cenário: Exposição de dados em resposta de API
Quando eu realizo uma chamada para a API de consulta de dados
Então a resposta da API deve conter apenas dados associados à minha conta
E nenhum dado de outros clientes deve ser retornado

@cenario-de-excecao
Cenário: Exportação de dados contendo informações de outros clientes
Quando eu solicito a exportação dos meus dados
Então o arquivo exportado deve conter apenas informações da minha conta
E nenhum dado pertencente a outros clientes deve estar presente no arquivo

@cenario-de-excecao
Cenário: Usuário não autenticado tentando acessar dados restritos
Dado que eu não estou autenticado no sistema
Quando eu tento acessar uma página de dados protegidos
Então eu devo ser redirecionado para a página "/login"
E eu devo ver a mensagem "Sessão inválida ou expirada."