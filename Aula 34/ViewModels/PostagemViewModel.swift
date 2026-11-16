// Importações
import Foundation
import Observation

// Classe
@MainActor
@Observable
class PostagemViewModel {
    
    // Variáveis
    var postagens: [Postagem] = []
    var estaCarregando = false
    var falhaRequisicao: String?
    
    // Objeto do tipo PostagemService
    private let postagemService = PostagemService()
    
    // Carregar todas as postagens
    func carregarPostagens() async {
        
        // Definir que as postagens estão sendo carregadas
        estaCarregando = true
        
        // Defer
        defer {estaCarregando = false}
        
        // Executar a listagem de postagens
        await executar {
            postagens = try await postagemService.listarPostagens()
        }
        
    }
    
    // Executar
    private func executar(_ acao: () async throws -> Void) async -> Bool {}
    
    
}
