# TaskFlow - Sistema de Gestão de Tarefas e Projetos

> Repositório oficial desenvolvido para o **Projeto Integrador Transdisciplinar em Engenharia de Software II**. O TaskFlow é uma aplicação web voltada para o gerenciamento de equipes e acompanhamento de fluxo de tarefas (*Kanban*), aplicando boas práticas de engenharia de software, modelagem de dados, arquitetura em camadas e testes.

---

## 📋 Sumário
1. [Visão Geral do Projeto](#visão-geral-do-projeto)
2. [Arquitetura e Padrões Utilizados](#arquitetura-e-padrões-utilizados)
3. [Modelagem de Dados & Dicionário](#modelagem-de-dados--dicionário)
4. [Estrutura do Repositório](#estrutura-do-repositório)
5. [Tecnologias Utilizadas](#tecnologias-utilizadas)
6. [Testes e Validação com Usuários](#testes-e-validação-com-usuários)
7. [Autor](#autor)

---

## 🚀 1. Visão Geral do Projeto
O **TaskFlow** foi concebido para resolver o problema de desorganização no acompanhamento de entregas de equipes de desenvolvimento e negócios. Ele permite o cadastro de usuários, criação de projetos corporativos, atribuição de tarefas com níveis de prioridade e controle de status por meio de colunas de progresso (*A Fazer*, *Em Andamento*, *Concluído*).

---

## 🏛️ 2. Arquitetura e Padrões Utilizados
O projeto segue rigorosamente o padrão arquitetural **MVC (Model-View-Controller)** para garantir a separação de responsabilidades:
* **Model (Modelo):** Responsável pela estrutura de dados, regras de negócio e comunicação com o banco de dados.
* **View (Visualizador):** Interface do usuário construída com foco em UX/UI (claridade, consistência e feedback imediato).
* **Controller (Controlador):** O cérebro da aplicação, que intercepta as requisições HTTP, aciona o modelo e retorna a resposta adequada para a view.

---

## 🗄️ 3. Modelagem de Dados & Dicionário

### Esquema do Banco de Dados (Projeto Físico - SQL)
```sql
-- Criação da tabela de Usuários
CREATE TABLE usuarios (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    cargo VARCHAR(50)
);

-- Criação da tabela de Projetos
CREATE TABLE projetos (
    id_projeto SERIAL PRIMARY KEY,
    nome_projeto VARCHAR(100) NOT NULL,
    descricao TEXT,
    data_inicio DATE NOT NULL,
    data_termino DATE NOT NULL
);

-- Criação da tabela de Tarefas
CREATE TABLE tarefas (
    id_tarefa SERIAL PRIMARY KEY,
    id_projeto INT REFERENCES projetos(id_projeto) ON DELETE CASCADE,
    id_usuario_responsavel INT REFERENCES usuarios(id_usuario) ON DELETE SET NULL,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT,
    prioridade VARCHAR(20) DEFAULT 'Média',
    status VARCHAR(30) DEFAULT 'A Fazer',
    data_vencimento DATE NOT NULL
);