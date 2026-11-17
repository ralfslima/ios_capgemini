import Foundation

struct ViaCEPResponse: Decodable {
    let uf: String?
    let localidade: String?
    let bairro: String?
    let logradouro: String?
    let erro: Bool?
}

enum ViaCEPError: LocalizedError {
    case cepInvalido
    case naoEncontrado

    var errorDescription: String? {
        switch self {
        case .cepInvalido:
            return "O CEP deve conter oito números."
        case .naoEncontrado:
            return "CEP não encontrado."
        }
    }
}

struct ViaCEPService {

    func buscarCEP(_ cep: String) async throws -> ViaCEPResponse {

        guard cep.count == 8,
              cep.allSatisfy(\.isNumber) else {
            throw ViaCEPError.cepInvalido
        }

        let url = URL(
            string: "https://viacep.com.br/ws/\(cep)/json/"
        )!

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse,
              (200...299).contains(response.statusCode) else {
            throw URLError(.badServerResponse)
        }

        let resultado = try JSONDecoder().decode(
            ViaCEPResponse.self,
            from: data
        )

        if resultado.erro == true {
            throw ViaCEPError.naoEncontrado
        }

        return resultado
    }
}
