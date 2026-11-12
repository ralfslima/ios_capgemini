// Importações
import Foundation
import Observation
import SwiftData

// Classe
@MainActor
@Observable
class TarefaViewModel {
    
    // ModelContext (Disponibilizar todas as funcionalidades SQL do SwiftData/SQLite)
    private var modelContext: ModelContext
    
    // Lista de tarefas
    var tarefas: [Tarefa] = []
    
    // Campos de dados
    var titulo = ""
    var descricao = ""
    var data = Date.now
    
    // Construtor / Inicializador
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        listarTarefas()
    }
    
    // Listar todas as tarefas (SELECT * FROM tarefa)
    func listarTarefas() {
        let descriptor = FetchDescriptor<Tarefa>()
        tarefas = (try? modelContext.fetch(descriptor)) ?? []
    }
    
    // Cadastrar uma nova tarefa (INSERT INTO tarefa VALUES (titulo, descrição, data);)
    func cadastrarTarefa() {
        // Efetuar o cadastro
        let objTarefa = Tarefa(titulo: titulo, descricao: descricao, data: data)
        modelContext.insert(objTarefa)
        
        // Limpar campos
        titulo = ""
        descricao = ""
        data = .now
        
        // Atualizar lista de tarefas
        listarTarefas()
        //tarefas.append(objTarefa)
    }
    
    // Remover uma tarefa (DELETE FROM tarefa WHERE titulo=? AND descrição=? AND data=?)
    func removerTarefa(offSets: IndexSet) {
        
        // 1ª Opção (Quando haverá remoção de apenas um registro)
        guard let indice = offSets.first else { return }
        modelContext.delete(tarefas[indice])
        
        // 2ª Opção (Quando haverá remoção de vários registros)
        //for indice in offSets {
        //    modelContext.delete(tarefas[indice])
        //}
        
        listarTarefas()
        
    }
    
}
