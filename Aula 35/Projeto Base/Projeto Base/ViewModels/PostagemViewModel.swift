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
        defer { estaCarregando = false }
        
        // Executar a listagem de postagens
        await executar {
            postagens = try await postagemService.listarPostagens()
        }
        
    }
    
    // Cadastrar postagem
    func cadastrar(titulo: String, texto: String) async {
        
        // Definir que as postagens estão sendo carregadas
        estaCarregando = true
        
        // Defer
        defer { estaCarregando = false }
        
        // Efetuar cadastro
        await executar {
            
            // Obter a nova postagem
            let novaPostagem = try await postagemService.cadastrarPostagem(titulo: titulo, texto: texto)
            
            // Atualizar a lista de postagens
            postagens.insert(novaPostagem, at: 0)
            
        }
        
    }
    
    // Remover postagem
    func remover(offsets: IndexSet) async {
        
        // Laço de repetição
        for indice in offsets {
            let postagem = postagens[indice]
            
            await executar {
                try await postagemService.removerPostagem(id: postagem.idServidor)
                postagens.removeAll{ $0.id == postagem.id }
            }
        }
        
    }
    
    // Executar
    @discardableResult
    private func executar(_ acao: () async throws -> Void) async -> Bool {
        
        // Redefinir o valor nil na variável falha requisição
        falhaRequisicao = nil
        
        // Do/Catch
        do {
            try await acao()
            return true
        } catch {
            falhaRequisicao = error.localizedDescription
            return false
        }
        
    }
    

    
}
