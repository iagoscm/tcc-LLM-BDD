Feature: Customização da carta de Benefit Summary e Service Verification
Como um usuário, eu quero customizar minha carta de Benefit Summary e Service Verification
para que eu possa utilizá-la para múltiplos propósitos (como assistência habitacional, alívio fiscal, etc.).

Pré-condição:
Dado que eu estou autenticado no sistema
E que eu estou na página de geração da carta de Benefit Summary e Service Verification

@caminho-feliz @smoke
Cenário: Gerar carta personalizada para assistência habitacional
Quando eu seleciono o propósito "Housing Assistance"
E eu seleciono incluir as informações de benefício atuais
E eu clico no botão "Generate Letter"
Então eu devo visualizar uma prévia da carta personalizada
E a carta deve conter o propósito "Housing Assistance"

@caminho-feliz
Cenário: Gerar carta personalizada para alívio fiscal
Quando eu seleciono o propósito "Tax Relief"
E eu seleciono incluir o histórico de benefícios
E eu clico no botão "Generate Letter"
Então eu devo visualizar uma prévia da carta personalizada
E a carta deve conter o propósito "Tax Relief"

@caminho-feliz
Cenário: Baixar carta personalizada gerada com sucesso
Quando eu seleciono o propósito "Housing Assistance"
E eu clico no botão "Generate Letter"
E eu clico no botão "Download PDF"
Então o arquivo PDF da carta personalizada deve ser baixado com sucesso

@cenario-de-excecao
Cenário: Tentativa de gerar carta sem selecionar um propósito
Quando eu clico no botão "Generate Letter"
Então eu devo ver a mensagem de erro "Please select a purpose for the letter."

@cenario-de-excecao
Cenário: Tentativa de acessar a funcionalidade sem autenticação
Dado que eu não estou autenticado no sistema
Quando eu tento acessar a página de geração da carta
Então eu devo ser redirecionado para a página "/login"

@cenario-de-excecao
Cenário: Falha ao gerar a carta devido a indisponibilidade do serviço
Quando eu seleciono o propósito "Tax Relief"
E eu clico no botão "Generate Letter"
Mas o serviço de geração de cartas está indisponível
Então eu devo ver a mensagem de erro "Unable to generate the letter at this time. Please try again later."
