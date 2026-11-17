/**
 * TaskFlow - Model (Camada de Dados)
 * Gerencia a lógica de dados e conexão com o banco (simulado via JSON/SQLite ou classes orientadas a objetos)
 */

class TaskModel {
    constructor() {
        // Mock de dados iniciais para demonstração funcional do MVC
        this.projetos = [
            { id: 1, nome_projeto: "Migração Cloud", descricao: "Migrar servidores locais para a AWS", data_inicio: "2026-03-01", data_termino: "2026-04-15" }
        ];
        this.tarefas = [
            { id: 1, id_projeto: 1, id_usuario_responsavel: 1, titulo: "Configurar EC2", descricao: "Subir instâncias iniciais", prioridade: "Alta", status: "Em Andamento", data_vencimento: "2026-03-10" }
        ];
    }

    getAllProjetos() {
        return this.projetos;
    }

    addProjeto(projeto) {
        projeto.id = this.projetos.length + 1;
        this.projetos.push(projeto);
        return projeto;
    }

    getAllTarefas() {
        return this.tarefas;
    }

    addTarefa(tarefa) {
        tarefa.id = this.tarefas.length + 1;
        this.tarefas.push(tarefa);
        return tarefa;
    }

    updateStatusTarefa(id_tarefa, novoStatus) {
        const tarefa = this.tarefas.find(t => t.id === id_tarefa);
        if (tarefa) {
            tarefa.status = novoStatus;
            return true;
        }
        return false;
    }
}

module.exports = new TaskModel();