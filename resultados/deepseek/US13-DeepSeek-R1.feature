Feature: Coleta de Logs para SIEM
  Como um cliente de uma empresa de software, eu quero poder coletar logs em um formato padrão para um SIEM ou outra ferramenta de segurança, que contenham informações como acessos de usuários e administradores, mas não informações sensíveis como senhas ou dados pessoais.

  Pré-condição:
  Dado que o sistema de coleta de logs está ativo e configurado para exportar no formato CEF

  @caminho-feliz
  Cenário: Log de acesso de usuário contém identificação mas exclui senha
    Quando um evento de autenticação bem-sucedida é gerado para o usuário "usuario@exemplo.com"
    E a senha utilizada na autenticação é "senhaSegura123"
    Então o log exportado deve conter o campo "usuário" com o valor "usuario@exemplo.com"
    E o log exportado não deve conter o texto "senhaSegura123"
    E o log exportado não deve conter campos de dados pessoais como CPF, RG ou nome completo

  @cenario-de-excecao
  Cenário: Tentativa de inclusão de senha no log é automaticamente filtrada
    Quando um evento de autenticação mal-sucedida é gerado para o usuário "admin@exemplo.com"
    E o sistema tenta registrar a senha incorreta "senhaErrada"
    Então o log resultante não deve conter "senhaErrada"
    E o log deve conter apenas a indicação de "falha de autenticação" sem expor a credencial