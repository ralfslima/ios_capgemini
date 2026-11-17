// Importar Foundation
import Foundation

// Struct
struct Postagem: Codable, Identifiable {
    // Id local de cada postagem
    var id: UUID = UUID()
    
    // Atributos do struct
    let idServidor: Int
    let idUsuario: Int
    let titulo: String
    let texto: String
    
    // CodingKeys (mapeamento)
    enum CodingKeys: String, CodingKey {
        case idServidor = "id"
        case idUsuario  = "userId"
        case titulo     = "title"
        case texto      = "body"
    }
}

