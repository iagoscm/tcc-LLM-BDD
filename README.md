# Repositório de Artefatos para a Monografia de TCC - Iago Campelo

## Avaliação da Cobertura Funcional de Testes de Aceitação BDD Gerados por Modelos de Linguagem Grandes (LLMs)

### Sobre este Repositório

Este repositório contém todos os artefatos de pesquisa, dados brutos e resultados gerados para a minha monografia de conclusão de curso em Engenharia de Software na Universidade de Brasília (UnB).

O objetivo deste trabalho é avaliar quantitativa e qualitativamente a capacidade de três Modelos de Linguagem Grandes (LLMs) — GPT-4, Gemini 2.5 e DeepSeek V3.2 — de gerar cenários de teste BDD (Behavior-Driven Development) a partir de Histórias de Usuário do mundo real.

A manutenção deste repositório visa garantir a total transparência, rastreabilidade e replicabilidade do experimento conduzido.

### Estrutura do Repositório

*   **`/dataset.md`**: Este arquivo é o catálogo oficial e documentado das **20 Histórias de Usuário** que compõem o dataset do experimento. Cada história foi rigorosamente selecionada de repositórios de software de código aberto de alta relevância profissional.
    *   [**Visualizar o Catálogo de Histórias de Usuário**](./dataset.md)

*   **`/Resultados/`**: Esta pasta conterá os **60 artefatos `.feature`** gerados pelos três LLMs para cada uma das 20 histórias de usuário. A estrutura será organizada da seguinte forma:
    ```
    Resultados/
    ├── US-01/
    │   ├── gpt4.feature
    │   ├── gemini.feature
    │   └── deepseek.feature
    ├── US-02/
    │   └── ...
    ```

*   **Matriz de Rastreabilidade e Análise de Dados (Google Sheets):** A análise completa, incluindo a matriz de rastreabilidade manual, o cálculo das métricas de cobertura funcional e as análises qualitativas, está centralizada em uma planilha no Google Sheets. Este documento serve como a "bancada de laboratório" da pesquisa.
    *   **[Acessar a Matriz de Rastreabilidade](https://docs.google.com/spreadsheets/d/16wSnoM2jD2chAx2Gvyq87OgWF7f3Zb4EaGIins1H7ck/edit?usp=sharing)** 

### Sobre

*   **Autor:** Iago de Sousa Campelo Matos
*   **Orientadora:** Prof.ª Dr.ª Elaine Venson
*   **Instituição:** Universidade de Brasília (UnB) - Faculdade do Gama (FGA)
*   **Curso:** Bacharel em Engenharia de Software