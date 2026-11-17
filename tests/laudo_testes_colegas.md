# Laudo de Testes e Validação com Usuários (TaskFlow)
*Projeto Integrador Transdisciplinar em Engenharia de Software II*

Este documento registra as avaliações de aceitação, usabilidade e testes funcionais realizados por 5 usuários (colegas de curso e profissionais da área) utilizando o sistema TaskFlow.

---

## Avaliador 1: Carlos Eduardo (Desenvolvedor Full-Stack)
* **Data do Teste:** 08/10/2026
* **O que testou e funcionou:** Criação de novas tarefas pelo formulário do Dashboard, preenchimento de prioridades e datas de vencimento, e inclusão imediata no quadro Kanban.
* **O que testou e não funcionou / Bugs encontrados:** Nenhum erro crítico na interface. Sugeriu adicionar um filtro rápido por prioridade na coluna Kanban.
* **Funcionalidade não testada:** Edição avançada de perfis de usuário na aba de equipe (não testada por falta de tempo na sessão).

---

## Avaliador 2: Mariana Souza (Analista de Qualidade / QA)
* **Data do Teste:** 09/10/2026
* **O que testou e funcionou:** Navegação fluida entre as abas da barra lateral (Dashboard, Projetos, Equipe e Configurações).
* **O que testou e não funcionou / Bugs encontrados:** O layout se comportou perfeitamente. Apontou a necessidade de validação caso o usuário tente enviar o formulário com o campo de título vazio.
* **Funcionalidade não testada:** Integração com banco de dados real em nuvem (utilizado ambiente local/mock).

---

## Avaliador 3: Lucas Gabriel (Estudante de Engenharia de Software)
* **Data do Teste:** 10/10/2026
* **O que testou e funcionou:** Responsividade visual do painel corporativo e o design limpo em cores neutras.
* **O que testou e não funcionou / Bugs encontrados:** Tudo funcionou conforme o esperado.
* **Funcionalidade não testada:** Relatórios de produtividade por projeto.

---

## Avaliador 4: Beatriz Lima (Product Owner / Gestora)
* **Data do Teste:** 11/10/2026
* **O que testou e funcionou:** Visualização geral dos projetos ativos na tabela da aba Projetos e a intuitividade do painel Kanban.
* **O que testou e não funcionou / Bugs encontrados:** Nenhuma falha apontada. Aprovou a usabilidade.
* **Funcionalidade não testada:** Notificações automáticas por e-mail (simuladas nas configurações).

---

## Avaliador 5: Rafael Mendes (Engenheiro de Dados)
* **Data do Teste:** 12/10/2026
* **O que testou e funcionou:** Estrutura do schema SQL e as chaves estrangeiras com integridade referencial.
* **O que testou e não funcionou / Bugs encontrados:** Aprovou o modelo relacional normalizado.
* **Funcionalidade não testada:** Testes de carga sob alto volume de requisições.

---

## 🔧 Melhorias Implementadas após o Feedback:
1. Adicionada validação estrita no formulário de tarefas para impedir entradas vazias.
2. Refinamento visual nas cores das badges de prioridade para melhor acessibilidade.