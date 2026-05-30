Funcionalidade: Remoção de Infraestrutura de Avaliação Obsoleta
  Como um Engenheiro de Plataforma, quero que toda a infraestrutura de avaliação obsoleta seja removida para que novos contribuidores vejam apenas um framework de avaliação e um pipeline de CI, eliminando confusão sobre qual sistema usar.

  Pré-condição:
    Dado que as migrações das Issues #1 a #4 foram concluídas e validadas
    E a suíte de avaliação completa `vally eval --suite full` está passando
    E o pipeline de CI unificado está operacional

  @caminho-feliz @smoke
  Cenário: Remoção completa da infraestrutura obsoleta
    Quando eu executo o processo de remoção da infraestrutura obsoleta
    Então os diretórios de tarefas Waza (`tasks/*.yaml`) devem ser excluídos
    E o arquivo `.waza.yaml` deve ser excluído
    E os scripts npm relacionados ao Waza devem ser removidos do `package.json`
    E todos os arquivos `integration.test.ts` sob `tests/<skill>/` devem ser excluídos
    E a configuração do Jest (`jest.config.ts`) deve ser atualizada para excluir os caminhos removidos
    E todos os arquivos `triggers.test.ts` sob `tests/<skill>/` devem ser excluídos
    E o arquivo `tests/utils/TriggerMatcher.ts` deve ser excluído
    E os snapshots de testes de triggers (`__snapshots__/triggers.*`) devem ser excluídos
    E os workflows de CI antigos (`eval.yml` e jobs de integração Jest) devem ser removidos
    E a documentação `tests/README.md` deve ser atualizada para refletir que avaliações LLM estão em `evals/` e testes unitários em `tests/`
    E o relatório `EVAL-MIGRATION-REPORT.md` deve ser movido para `docs/archive/`
    E ao executar `vally eval --suite full` todos os testes de avaliação devem passar
    E ao executar todos os testes unitários Jest restantes todos devem passar
    E uma busca por "waza" em arquivos `.ts`, `.yaml`, `.yml`, `.json` deve retornar zero ocorrências fora de `docs/archive/`
    E uma busca por "TriggerMatcher" em arquivos `.ts` deve retornar zero ocorrências

  @cenario-de-excecao
  Cenário: Tentativa de remoção sem validação da migração
    Dado que a validação da migração (Issue 4) não foi executada ou apresentou discrepâncias
    Quando eu tento executar o processo de remoção da infraestrutura obsoleta
    Então o sistema deve bloquear a remoção e exibir a mensagem "Validação de migração pendente. Execute a validação antes de remover a infraestrutura."
    E nenhum arquivo deve ser excluído