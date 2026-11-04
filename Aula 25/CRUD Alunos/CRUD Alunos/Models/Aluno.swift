// Importar Foundation para ter acesso ao Identifiable e Codable
import Foundation

// Struct
struct Aluno: Identifiable, Codable {
    var id = UUID()
    var nome: String
    var nota1: Double
    var nota2: Double
    
    var media: Double { return (nota1 + nota2) / 2 }
    
    var situacao: String { return media >= 7.0 ? "Aprovado(a)" : "Reprovado(a)" }
}
