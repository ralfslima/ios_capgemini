// Importações
import Foundation
import Observation
import SwiftUI

// Classe
@MainActor
@Observable
class PessoaViewModel {
    
    // Lista de pessoas
    var pessoas: [Pessoa] = []
    
    // Campos de entrada
    var nome:   String = ""
    var email:  String = ""
    var estado: String = ""
    var cidade: String = ""
    
    // Referência do PessoaFileManager
    private let fileManager = PessoaFileManager.shared
    
    // Construtor / Inicializador
    init() {
        pessoas = fileManager.carregar()
    }
    
    // Função para cadastrar / adicionar pessoas
    func cadastrar() {
        // Criar objeto do tipo Pessoa
        let p = Pessoa(
            nome: nome,
            email: email,
            estado: estado,
            cidade: cidade
        )
        
        // Cadastrar uma nova pessoa na lista
        pessoas.append(p)
        
        // Atualizar arquivo JSON
        fileManager.salvar(pessoas: pessoas)
        
        // Limpar campos de entrada
        nome   = ""
        email  = ""
        estado = ""
        cidade = ""
    }
    
    // Função para remover pessoas
    func remover(indice: IndexSet) {
        // Remover pessoa da lista local
        pessoas.remove(atOffsets: indice)
        
        // Remover pessoa do JSON (atualização)
        fileManager.salvar(pessoas: pessoas)
    }

}
