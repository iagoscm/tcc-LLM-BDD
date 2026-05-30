Feature: Visualização do Resultado de uma Solicitação de Informações do Programa (PIR)

Como estudante ou usuário do ministério, quero visualizar o resultado de uma PIR concluída dentro da aplicação associada, para entender quais detalhes do programa e da oferta foram fornecidos pela instituição.

Pré-condição:
Dado que eu estou logado como um usuário "estudante" ou "ministério"

@caminho-feliz @smoke
Cenário: Visualizar resultado de PIR concluída com sucesso
Dado que a aplicação "APP-1001" possui uma PIR concluída
Quando eu acesso a página de detalhes da aplicação "APP-1001"
Então eu devo visualizar a seção "Informações do Programa" contendo:
  | Programa    | Engenharia de Software |
  | Oferta      | Bacharelado Integral   |
  | Instituição | Universidade Federal   |
E eu devo ver o status da PIR como "Concluída"

@cenario-de-excecao
Cenário: Tentativa de visualizar resultado de PIR com status pendente
Dado que a aplicação "APP-2002" possui uma PIR com status "pendente"
Quando eu acesso a página de detalhes da aplicação "APP-2002"
Então eu devo ver a mensagem "As informações do programa solicitadas ainda não foram fornecidas pela instituição."

@cenario-de-excecao
Cenário: Acesso sem autenticação à página de detalhes da aplicação
Dado que eu não estou logado
Quando eu tento acessar a página de detalhes da aplicação "APP-1001"
Então eu devo ser redirecionado para a página de login
E eu devo ver a mensagem "Faça login para continuar."