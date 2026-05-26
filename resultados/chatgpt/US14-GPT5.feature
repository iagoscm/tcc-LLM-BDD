Feature: Gerenciamento Seguro de Chaves Secretas da Aplicação

Como um cliente de empresa de software, eu preciso ter acesso
às chaves secretas da aplicação gerenciadas de forma segura.

Pré-condição:
Dado que eu estou autenticado no sistema
E que possuo permissão para acessar as chaves secretas da aplicação

@caminho-feliz @smoke
Cenário: Visualizar chave secreta da aplicação com permissão válida
Quando eu acesso a página de gerenciamento de chaves secretas
E eu seleciono a aplicação "Aplicacao Financeira"
Então eu devo visualizar a chave secreta da aplicação de forma segura

@caminho-feliz
Cenário: Copiar chave secreta da aplicação
Quando eu acesso a página de gerenciamento de chaves secretas
E eu seleciono a aplicação "Aplicacao Financeira"
E eu clico no botão "Copiar Chave"
Então a chave secreta deve ser copiada para a área de transferência

@caminho-feliz
Cenário: Gerar nova chave secreta para a aplicação
Quando eu acesso a página de gerenciamento de chaves secretas
E eu seleciono a aplicação "Aplicacao Financeira"
E eu clico no botão "Gerar Nova Chave"
Então uma nova chave secreta deve ser gerada com sucesso
E a chave antiga deve ser invalidada

@cenario-de-excecao
Cenário: Tentativa de acesso sem permissão às chaves secretas
Quando eu acesso a página de gerenciamento de chaves secretas
Então eu devo ver a mensagem de erro "Acesso não autorizado."

@cenario-de-excecao
Cenário: Tentativa de visualizar chave secreta de aplicação inexistente
Quando eu acesso a página de gerenciamento de chaves secretas
E eu seleciono a aplicação "Aplicacao Inexistente"
Então eu devo ver a mensagem de erro "Aplicação não encontrada."

@cenario-de-excecao
Cenário: Falha ao gerar nova chave secreta
Quando eu acesso a página de gerenciamento de chaves secretas
E eu seleciono a aplicação "Aplicacao Financeira"
E eu clico no botão "Gerar Nova Chave"
Mas ocorre uma falha no serviço de gerenciamento de segredos
Então eu devo ver a mensagem de erro "Não foi possível gerar uma nova chave secreta."