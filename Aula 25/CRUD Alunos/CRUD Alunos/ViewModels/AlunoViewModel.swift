// Importações
import Foundation
import Observation
import SwiftUI

// Classe
@MainActor
@Observable
class AlunoViewModel {

    // Lista de alunos
    var alunos: [Aluno] = []
    
    // Objetos de formulário
    var formularioCadastro = AlunoFormulario()
    var formularioEdicao   = AlunoFormulario()
    
}


