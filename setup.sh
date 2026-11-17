#!/bin/bash
# ==============================================================================
# Script de Criação de Estrutura de Pastas para o Projeto Integrador II
# Tema: TaskFlow (Sistema de Gestão de Tarefas e Projetos)
# ==============================================================================

echo "Criando a estrutura de diretórios do projeto..."

# Criação das pastas principais
mkdir -p documentacao
mkdir -p src/models
mkdir -p src/views
mkdir -p src/controllers
mkdir -p database
mkdir -p tests

# Criação de arquivos base para organização
touch documentacao/planejamento.md
touch database/schema_sql.sql
touch database/dicionario_dados.md
touch tests/laudo_testes_colegas.pdf
touch src/models/.gitkeep
touch src/views/.gitkeep
touch src/controllers/.gitkeep

echo "Estrutura de pastas criada com sucesso!"
echo "--------------------------------------------------"
echo "Diretórios gerados:"
echo "├── documentacao/     (Planejamento, Escopo e Modelagem UML)"
echo "├── src/              (Código-fonte estruturado em MVC)"
echo "│   ├── models/"
echo "│   ├── views/"
echo "│   └── controllers/"
echo "├── database/         (Scripts SQL e Dicionário de Dados)"
echo "└── tests/            (Evidências e Laudos dos testes com 5 colegas)"
echo "--------------------------------------------------"
