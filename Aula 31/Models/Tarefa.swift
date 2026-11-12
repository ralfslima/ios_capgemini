// Importações
import Foundation
import SwiftData

// Classe
@Model
class Tarefa {
    var titulo: String
    var descricao: String
    var data: Date
    
    init(titulo: String, descricao: String, data: Date = .now) {
        self.titulo = titulo
        self.descricao = descricao
        self.data = data
    }
}
