import Foundation

struct Endereco: Identifiable {
    let id = UUID()

    let nome: String
    let cep: String
    let estado: String
    let cidade: String
    let bairro: String
    let logradouro: String
    let numero: String
}
