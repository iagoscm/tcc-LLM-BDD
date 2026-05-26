Feature: Remoção da Infraestrutura Deprecated de Avaliação
Como um Platform Engineer, eu quero remover toda a infraestrutura deprecated de avaliação
para que novos contribuidores vejam apenas um framework de avaliação e um único pipeline de CI, eliminando confusão sobre qual sistema utilizar.

Pré-condição:
Dado que todas as migrações foram validadas com sucesso
E que o pipeline unificado de CI está funcionando corretamente
E que o comando "vally eval --suite full" executa sem falhas
E que o script de validação de migração retorna zero discrepâncias

@caminho-feliz @smoke
Cenário: Remover toda a infraestrutura Waza do repositório
Quando eu removo todos os diretórios "tasks/*.yaml" das localizações antigas de eval
E eu removo o arquivo ".waza.yaml"
E eu removo os scripts relacionados ao Waza do arquivo "package.json"
E eu removo os scripts bridge relacionados ao Waza
Então nenhum arquivo relacionado ao Waza deve existir no repositório
E o comando "grep -r "waza" . --include="*.ts" --include="*.yaml" --include="*.yml" --include="*.json"" deve retornar zero ocorrências fora de "docs/archive/"

@caminho-feliz
Cenário: Remover testes de integração Jest deprecated
Quando eu removo todos os arquivos "tests/*/integration.test.ts"
E eu atualizo o arquivo "jest.config.ts" para excluir os caminhos removidos
Então os testes unitários restantes devem continuar executando com sucesso
E os arquivos "tests/*/unit.test.ts" devem permanecer intactos
E o diretório "tests/utils/" deve permanecer disponível sem utilitários deprecated

@caminho-feliz
Cenário: Remover TriggerMatcher e testes de trigger deprecated
Quando eu removo todos os arquivos "tests/*/triggers.test.ts"
E eu removo o arquivo "tests/utils/TriggerMatcher.ts"
E eu removo os snapshots associados em "tests/*/**snapshots**/triggers.*"
Então o comando "grep -r "TriggerMatcher" . --include="*.ts"" deve retornar zero ocorrências

@caminho-feliz @smoke
Cenário: Garantir que apenas o novo pipeline de CI permaneça ativo
Quando eu removo o workflow antigo ".github/workflows/eval.yml"
E eu removo os jobs de integração Jest antigos dos workflows existentes
Então o pipeline "evals.yml" deve ser o único pipeline de avaliação ativo
E o pipeline deve ser acionado corretamente em uma pull request de teste

@caminho-feliz
Cenário: Atualizar documentação para refletir a nova estrutura de testes
Quando eu atualizo o arquivo "tests/README.md"
E eu movo o arquivo "EVAL-MIGRATION-REPORT.md" para "docs/archive/"
Então a documentação deve informar que os LLM evals estão em "evals/"
E a documentação deve informar que os testes unitários permanecem em "tests/"

@caminho-feliz @smoke
Cenário: Validar integridade do sistema após remoção da infraestrutura deprecated
Quando eu executo o comando "vally eval --suite full"
E eu executo todos os testes unitários Jest restantes
Então todos os evals devem passar com sucesso
E todos os testes unitários devem passar sem falhas
E nenhuma funcionalidade remanescente deve ser impactada pelas remoções

@cenario-de-excecao
Cenário: Impedir remoção da infraestrutura antes da validação de migração
Dado que o script de validação de migração retorna discrepâncias
Quando eu tento remover os arquivos e diretórios deprecated
Então a remoção não deve ser executada
E uma mensagem de erro deve informar "A migração deve ser validada antes da remoção da infraestrutura deprecated"

@cenario-de-excecao
Cenário: Impedir remoção dos workflows antigos antes da validação do pipeline unificado
Dado que o pipeline unificado "evals.yml" ainda não foi validado
Quando eu tento remover os workflows antigos de CI
Então os workflows antigos não devem ser removidos
E uma mensagem de erro deve informar "O pipeline unificado deve ser validado antes da remoção dos workflows antigos"

@cenario-de-excecao
Cenário: Falha na execução dos testes unitários após atualização do Jest config
Quando eu atualizo o arquivo "jest.config.ts"
E eu executo os testes unitários Jest restantes
Então o sistema deve reportar falha na configuração
E a alteração no arquivo "jest.config.ts" não deve ser aprovada

@cenario-de-excecao
Cenário: Detectar referências remanescentes ao Waza após limpeza
Quando eu executo o comando "grep -r "waza" . --include="*.ts" --include="*.yaml" --include="*.yml" --include="*.json""
Então nenhuma referência ao Waza deve ser encontrada fora de "docs/archive/"
Mas caso existam ocorrências remanescentes
Então o processo de remoção deve ser considerado incompleto

@cenario-de-excecao
Cenário: Detectar referências remanescentes ao TriggerMatcher após remoção
Quando eu executo o comando "grep -r "TriggerMatcher" . --include="*.ts""
Então nenhuma referência ao TriggerMatcher deve existir
Mas caso existam ocorrências remanescentes
Então o processo de aposentadoria do TriggerMatcher deve falhar
