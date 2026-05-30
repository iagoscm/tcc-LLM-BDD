Feature: Personalização da Carta de Resumo de Benefícios e Verificação de Serviço
Como um usuário, eu quero personalizar minha carta de Resumo de Benefícios e Verificação de Serviço para que eu possa usá-la para múltiplos propósitos (como assistência habitacional, isenção fiscal, etc.).

Pré-condição:
Dado que eu estou na página de personalização da carta de benefícios

@caminho-feliz @smoke
Cenário: Gerar carta personalizada para assistência habitacional
Quando eu seleciono a opção de propósito "Assistência Habitacional"
E eu seleciono as informações de "Resumo de Renda" e "Histórico de Residência"
E eu clico no botão "Gerar Carta"
Então eu devo ser redirecionado para a página "/visualizacao-carta"
E o documento gerado deve conter apenas as informações relevantes para assistência habitacional

@caminho-feliz
Cenário: Gerar carta personalizada para isenção fiscal
Quando eu seleciono a opção de propósito "Isenção Fiscal"
E eu seleciono as informações de "Totais de Benefícios Recebidos no Ano"
E eu clico no botão "Gerar Carta"
Então eu devo ser redirecionado para a página "/visualizacao-carta"
E o documento gerado deve conter apenas as informações relevantes para isenção fiscal

@cenario-de-excecao
Cenário: Tentativa de gerar carta sem selecionar um propósito
Quando eu não seleciono nenhuma opção de propósito
E eu clico no botão "Gerar Carta"
Então eu devo ver a mensagem de erro "Por favor, selecione um propósito ou as informações que deseja incluir na carta."

@cenario-de-excecao
Cenário: Tentativa de gerar carta com opções incompatíveis
Quando eu seleciono a opção de propósito "Isenção Fiscal"
E eu tento adicionar manualmente o "Histórico de Penalidades"
E eu clico no botão "Gerar Carta"
Então eu devo ver a mensagem de erro "As informações selecionadas não são compatíveis com o propósito escolhido."