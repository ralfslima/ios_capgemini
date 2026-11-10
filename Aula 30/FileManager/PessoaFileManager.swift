// Importar Foundation
import Foundation

// Classe
class PessoaFileManager: Sendable {
    
    // Constante (shared)
    static let shared = PessoaFileManager()
    
    // Constante (arquivo)
    private let arquivo = "pessoas.json"
    
    init() {}
    
    // Variável (diretório)
    private var diretorio: URL {
        let local = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return local[0].appendingPathComponent(arquivo)
    }
    
    // Função para salvar
    func salvar(pessoas: [Pessoa]) {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            
            let dados = try encoder.encode(pessoas)
            
            try dados.write(to: diretorio)
        } catch {
            print("Erro ao salvar no JSON: \(error.localizedDescription)")
        }
    }
    
    // Função para carregar/listar todas as pessoas
    func carregar() -> [Pessoa] {
        
        do {
            let dados = try Data(contentsOf: diretorio)
            
            let decoder = JSONDecoder()
            
            return try decoder.decode([Pessoa].self, from: dados)
        } catch {
            print("Erro ao carregar o arquivo JSON: \(error.localizedDescription)")
            return []
        }
        
    }
    
}

