// Importar Foundation
import Foundation

// Classe
class PostagemService {
    
    // URL da API
    private let endereco = "https://jsonplaceholder.typicode.com/posts"
    
    // Validar retorno da requisição
    private func validar(_ resposta: URLResponse) throws {
        guard let retorno = resposta as? HTTPURLResponse, (200...299).contains(retorno.statusCode)
        else {
            throw URLError(.badServerResponse)
        }
    }
    
    // Listar todas as postagens
    func listarPostagens() async throws -> [Postagem] {
        
        // Validar se o endpoint está funcionando
        guard let url = URL(string: endereco) else { throw URLError(.badURL) }
        
        // Efetuar a requisição para a API
        let (dados, resposta) = try await URLSession.shared.data(from: url)
        
        // Validar o retorno da requisição
        try validar(resposta)
        
        // Retorno da função
        return try JSONDecoder().decode([Postagem].self, from: dados)
        
    }
    
    // Cadastrar postagem
    func cadastrarPostagem(titulo: String, texto: String) async throws -> Postagem {
        
        // Validar se o endpoint está funcionando
        guard let url = URL(string: endereco) else { throw URLError(.badURL) }
        
        // Configurar requisição POST
        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = "POST"
        requisicao.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Objeto para efetuar o cadastro
        let obj = Postagem(idServidor: 0, idUsuario: 1, titulo: titulo, texto: texto)
        
        // Realizar o cadastramento
        requisicao.httpBody = try JSONEncoder().encode(obj)
        let (dados, resposta) = try await URLSession.shared.data(for: requisicao)
        
        // Validar o retorno da requisição
        try validar(resposta)
        
        // Retorno da função
        return try JSONDecoder().decode(Postagem.self, from: dados)
        
    }
    
    // Remover postagem
    func removerPostagem(id: Int) async throws -> Void {
        
        // Validar se o endpoint está funcionando
        guard let url = URL(string: "\(endereco)/\(id)") else { throw URLError(.badURL) }
        
        // Configurar requisição DELETE
        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = "DELETE"
        
        // Realizar a remoção
        let (_, resposta) = try await URLSession.shared.data(for: requisicao)
        
        // Validar o retorno da requisição
        try validar(resposta)
        
    }
    
}
