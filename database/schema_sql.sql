
-- Remover tabelas existentes caso precise resetar o banco (Ordem inversa de dependência)
DROP TABLE IF EXISTS tarefas;
DROP TABLE IF EXISTS projetos;
DROP TABLE IF EXISTS usuarios;

-- ------------------------------------------------------------------------------
-- 1. Tabela de Usuários
-- Armazena os dados dos colaboradores e administradores do sistema
-- ------------------------------------------------------------------------------
CREATE TABLE usuarios (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    cargo VARCHAR(50) DEFAULT 'Desenvolvedor',
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ------------------------------------------------------------------------------
-- 2. Tabela de Projetos
-- Armazena as informações gerais dos projetos corporativos gerenciados
-- ------------------------------------------------------------------------------
CREATE TABLE projetos (
    id_projeto SERIAL PRIMARY KEY,
    nome_projeto VARCHAR(100) NOT NULL,
    descricao TEXT,
    data_inicio DATE NOT NULL,
    data_termino DATE NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ------------------------------------------------------------------------------
-- 3. Tabela de Tarefas
-- Armazena as atividades associadas aos projetos e responsáveis (Padrão Kanban)
-- ------------------------------------------------------------------------------
CREATE TABLE tarefas (
    id_tarefa SERIAL PRIMARY KEY,
    id_projeto INT NOT NULL,
    id_usuario_responsavel INT,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT,
    prioridade VARCHAR(20) DEFAULT 'Média' CHECK (prioridade IN ('Baixa', 'Média', 'Alta')),
    status VARCHAR(30) DEFAULT 'A Fazer' CHECK (status IN ('A Fazer', 'Em Andamento', 'Concluído')),
    data_vencimento DATE NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Chaves Estrangeiras com regras de integridade
    CONSTRAINT fk_projeto 
        FOREIGN KEY (id_projeto) 
        REFERENCES projetos(id_projeto) 
        ON DELETE CASCADE,
        
    CONSTRAINT fk_usuario 
        FOREIGN KEY (id_usuario_responsavel) 
        REFERENCES usuarios(id_usuario) 
        ON DELETE SET NULL
);


-- Inserir Usuários Padrão
INSERT INTO usuarios (nome, email, senha, cargo) VALUES 
('Admin Master', 'admin@taskflow.com', '$2b$10$ExemploHashSenhaSegura1', 'Arquiteto de Software'),
('João da Silva', 'joao@taskflow.com', '$2b$10$ExemploHashSenhaSegura2', 'Desenvolvedor Front-end');

-- Inserir Projetos Iniciais
INSERT INTO projetos (nome_projeto, descricao, data_inicio, data_termino) VALUES 
('Migração Cloud', 'Migrar servidores locais e infraestrutura legada para a AWS', '2026-03-01', '2026-04-15'),
('Portal do Cliente', 'Desenvolvimento de painel web responsivo em arquitetura MVC', '2026-03-10', '2026-05-30');

-- Inserir Tarefas Iniciais no Kanban
INSERT INTO tarefas (id_projeto, id_usuario_responsavel, titulo, descricao, prioridade, status, data_vencimento) VALUES 
(1, 1, 'Configurar AWS EC2', 'Subir instâncias iniciais e configurar grupos de segurança', 'Alta', 'Em Andamento', '2026-03-10'),
(1, 2, 'Mapear Banco de Dados', 'Estruturar tabelas relacionais no PostgreSQL', 'Média', 'A Fazer', '2026-03-15'),
(2, 2, 'Desenvolver Tela de Login', 'Criar interface HTML/CSS baseada nos princípios de IHC', 'Baixa', 'A Fazer', '2026-03-20');