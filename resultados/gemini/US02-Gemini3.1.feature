Feature: Busca com Autocompletar Acessível
Como um usuário de Tecnologia Assistiva, eu quero poder pesquisar usando o autocompletar para encontrar e escolher um resultado correspondente de forma fácil e precisa.

Pré-condição:
Dado que eu estou no campo de busca com autocompletar ativado

@caminho-feliz @smoke
Cenário: Navegar e confirmar um resultado correspondente com sucesso
Quando eu digito "São Paulo"
E a lista de resultados é exibida e anunciada pela tecnologia assistiva
E eu navego para a opção "São Paulo, SP" deixando-a como "selecionada"
E eu pressiono "Enter" para confirmar a opção
Então o valor do campo de busca deve ser preenchido com "São Paulo, SP"
E a tecnologia assistiva deve anunciar que a seleção foi "confirmada"

@caminho-feliz
Cenário: Submeter formulário com resultado pré-selecionado
Quando eu digito "Bra"
E o sistema exibe os resultados e deixa a opção "Brasil" como "pré-selecionada"
E eu pressiono "Enter" sem navegar pelas opções adicionais
Então a opção "Brasil" deve ser "confirmada"
E o valor será submetido no formulário pai

@cenario-de-excecao
Cenário: Busca sem resultados correspondentes
Quando eu digito "Xyz123"
E o sistema não encontra nenhuma correspondência
Então eu devo ver a mensagem e a tecnologia assistiva deve anunciar "Nenhum resultado encontrado"
E nenhuma opção deve ficar "selecionada" ou "pré-selecionada"

@cenario-de-excecao
Cenário: Sair do autocompletar sem confirmar uma seleção
Quando eu digito "Rio"
E a lista de resultados é exibida
E eu navego pelos itens sem confirmar nenhum
E eu pressiono a tecla "Esc" ou movo o foco para fora do componente
Então a lista de opções de autocompletar deve ser fechada
E o texto digitado "Rio" deve ser mantido no campo de busca sem nenhuma seleção "confirmada"