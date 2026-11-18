/**
 * TaskFlow - Controller (Camada Controladora)
 * Faz a ponte entre as requisições da View e a manipulação de dados no Model.
 */

const TaskModel = require('../models/taskModel');

class TaskController {
    // Retorna todos os projetos para exibição
    listarProjetos(req, res) {
        try {
            const projetos = TaskModel.getAllProjetos();
            return { success: true, data: projetos };
        } catch (error) {
            return { success: false, message: error.message };
        }
    }

    // Cria um novo projeto
    criarProjeto(reqBody) {
        if (!reqBody.nome_projeto || !reqBody.data_termino) {
            return { success: false, message: "Nome e data de término são obrigatórios." };
        }
        const novo = TaskModel.addProjeto(reqBody);
        return { success: true, data: novo, message: "Projeto criado com sucesso!" };
    }

    // Retorna todas as tarefas
    listarTarefas(req, res) {
        try {
            const tarefas = TaskModel.getAllTarefas();
            return { success: true, data: tarefas };
        } catch (error) {
            return { success: false, message: error.message };
        }
    }

    // Cria uma nova tarefa
    criarTarefa(reqBody) {
        if (!reqBody.titulo || !reqBody.data_vencimento) {
            return { success: false, message: "Título e data de vencimento são obrigatórios." };
        }
        const novaTarefa = TaskModel.addTarefa(reqBody);
        return { success: true, data: novaTarefa, message: "Tarefa criada com sucesso!" };
    }

    // Atualiza status da tarefa (Kanban)
    mudarStatus(id_tarefa, status) {
        const atualizado = TaskModel.updateStatusTarefa(id_tarefa, status);
        if (atualizado) {
            return { success: true, message: "Status atualizado com sucesso!" };
        }
        return { success: false, message: "Tarefa não encontrada." };
    }
}

module.exports = new TaskController();