import Foundation

struct AlunoFormulario {
    var id: UUID? = nil
    var nome: String = ""
    var nota1: String = ""
    var nota2: String = ""
    
    mutating func limpar() {
        id = nil
        nome = ""
        nota1 = ""
        nota2 = ""
    }
    
    func converterFormularioParaModelo() -> Aluno? {
        let textoNome = nome.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let textoNota1 = nota1.replacingOccurrences(of: ",", with: ".")
        
        let textoNota2 = nota2.replacingOccurrences(of: ",", with: ".")
        
        guard
            !textoNome.isEmpty,
            let n1 = Double(textoNota1),
            let n2 = Double(textoNota2),
            (0...10).contains(n1),
            (0...10).contains(n2)
        else {
            return nil
        }
        
        if let idExistente = self.id {
            return Aluno(id: idExistente, nome: textoNome, nota1: n1, nota2: n2)
        } else {
            return Aluno(nome: textoNome, nota1: n1, nota2: n2)
        }
        
    }
    
    static func preencherFormulario(aluno: Aluno) -> AlunoFormulario {
        AlunoFormulario(
            id: aluno.id,
            nome: aluno.nome,
            nota1: String(aluno.nota1),
            nota2: String(aluno.nota2)
        )
    }
}
