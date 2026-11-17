import Foundation
import Observation

@MainActor
@Observable
final class EnderecoViewModel {

    var nome = ""
    var cep = ""
    var estado = ""
    var cidade = ""
    var bairro = ""
    var logradouro = ""
    var numero = ""

    var enderecos: [Endereco] = []

    var buscandoCEP = false
    var mensagemErro = ""
    var mostrarErro = false

    private let service = ViaCEPService()

    func consultarCEP() async {

        let cepLimpo = cep.filter(\.isNumber)

        guard cepLimpo.count == 8 else {
            return
        }

        buscandoCEP = true

        defer {
            buscandoCEP = false
        }

        do {
            let resultado = try await service.buscarCEP(cepLimpo)

            try Task.checkCancellation()

            estado = resultado.uf ?? ""
            cidade = resultado.localidade ?? ""
            bairro = resultado.bairro ?? ""
            logradouro = resultado.logradouro ?? ""

        } catch is CancellationError {
            return
        } catch {
            mensagemErro = error.localizedDescription
            mostrarErro = true
        }
    }

    func cadastrar() {

        guard !nome.trimmingCharacters(in: .whitespaces).isEmpty else {
            exibirErro("Informe o nome.")
            return
        }

        guard cep.filter(\.isNumber).count == 8 else {
            exibirErro("Informe um CEP válido.")
            return
        }

        guard !cidade.isEmpty && !estado.isEmpty else {
            exibirErro("Consulte um CEP válido.")
            return
        }

        guard !numero.trimmingCharacters(in: .whitespaces).isEmpty else {
            exibirErro("Informe o número do endereço.")
            return
        }

        let endereco = Endereco(
            nome: nome,
            cep: cep,
            estado: estado,
            cidade: cidade,
            bairro: bairro,
            logradouro: logradouro,
            numero: numero
        )

        enderecos.append(endereco)

        limparCampos()
    }

    func remover(_ endereco: Endereco) {
        enderecos.removeAll {
            $0.id == endereco.id
        }
    }

    func limparCampos() {
        nome = ""
        cep = ""
        estado = ""
        cidade = ""
        bairro = ""
        logradouro = ""
        numero = ""
    }

    private func exibirErro(_ mensagem: String) {
        mensagemErro = mensagem
        mostrarErro = true
    }
}
