// Importar SwiftUI
import SwiftUI

// Struct Aluno
struct Aluno {
    
    // Características (atributos) - nome, nota1 e nota2
    var nome: String  = ""
    var nota1: String = ""
    var nota2: String = ""
    
    // Característica média
    var media: Double {
        let n1 = Double(nota1) ?? 0
        let n2 = Double(nota2) ?? 0
        return (n1 + n2) / 2
    }
    
    // Característica situação
    var situacao: String {
        if media >= 7.0 {
            return "Aprovado(a)"
        } else if media >= 5.0 {
            return "Em Exame"
        } else {
            return "Reprovado(a)"
        }
    }
    
    // Característica cor
    var cor: Color {
        if media >= 7.0 {
            return .green
        } else if media >= 5.0 {
            return .orange
        } else {
            return .red
        }
    }
}
