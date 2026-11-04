import Foundation
import Observation
import SwiftUI

@MainActor
@Observable
class AlunoViewModel {
    
    var alunos: [Aluno] = []
    
    var formularioCadastro = AlunoFormulario()
    var formularioEdicao = AlunoFormulario()
    
    
    init() {
       // Mock de dados iniciais para os alunos testarem o app assim que ele abre
       alunos = [
           Aluno(nome: "Ana Silva", nota1: 8.5, nota2: 7.0),
           Aluno(nome: "Lucas Souza", nota1: 5.5, nota2: 6.0),
           Aluno(nome: "Maria Oliveira", nota1: 9.0, nota2: 9.5)
       ]
   }
    
    
    
    func cadastrar() -> String? {
        
        guard let novoAluno = formularioCadastro.converterFormularioParaModelo() else {
            return "Falha ao cadastrar! Verifique o nome e as duas notas."
        }
        
        alunos.append(novoAluno)
        formularioCadastro.limpar()
        return nil
        
    }
    
    func selecionarAlunoEdicao(aluno: Aluno) {
        formularioEdicao = .preencherFormulario(aluno: aluno)
    }
    
    func editar() -> String? {
        
        guard let alunoEditado = formularioEdicao.converterFormularioParaModelo() else {
            return "Falha ao cadastrar! Verifique o nome e as duas notas."
        }
        
        guard let indice = alunos.firstIndex(where: { $0.id == alunoEditado.id }) else {
            return "Aluno não encontrado."
        }
        
        alunos[indice] = alunoEditado
        
        return nil
    }
    
    func remover(indice: IndexSet) {
        alunos.remove(atOffsets: indice)
    }
    
}
