import Contacts
import SwiftUI

struct ContatoItem: Identifiable {
    let id: String
    let nomeCompleto: String
    let telefonePrincipal: String?
    let emailPrincipal: String?
}

@Observable
class ContatosViewModel {
    var contatos: [ContatoItem] = []
    var permissaoNegada = false
    var carregando = false
    
    private let store = CNContactStore()
    
    @MainActor
    func carregarContatos() async {
        carregando = true
        defer { carregando = false }
        
        do {
            let autorizado = try await store.requestAccess(for: .contacts)
            
            guard autorizado else {
                permissaoNegada = true
                return
            }
            
            permissaoNegada = false
            contatos = try await buscarNaAgenda()
            
        } catch {
            print("Erro ao acessar contatos: \(error.localizedDescription)")
        }
    }
    
    private func buscarNaAgenda() async throws -> [ContatoItem] {
        let chaves: [CNKeyDescriptor] = [
            CNContactIdentifierKey as CNKeyDescriptor,
            CNContactGivenNameKey as CNKeyDescriptor,
            CNContactFamilyNameKey as CNKeyDescriptor,
            CNContactPhoneNumbersKey as CNKeyDescriptor,
            CNContactEmailAddressesKey as CNKeyDescriptor
        ]
        
        let requisicao = CNContactFetchRequest(keysToFetch: chaves)
        requisicao.sortOrder = .givenName
        
        return try await Task.detached(priority: .userInitiated) {
            // ✅ Instanciado localmente dentro da Task em background,
            // evitando cruzar a barreira da MainActor no Swift 6
            let backgroundStore = CNContactStore()
            var resultado: [ContatoItem] = []
            
            try backgroundStore.enumerateContacts(with: requisicao) { contato, _ in
                let nome = "\(contato.givenName) \(contato.familyName)".trimmingCharacters(in: .whitespaces)
                let telefone = contato.phoneNumbers.first?.value.stringValue
                let email = contato.emailAddresses.first?.value as String?
                
                let item = ContatoItem(
                    id: contato.identifier,
                    nomeCompleto: nome.isEmpty ? "Sem Nome" : nome,
                    telefonePrincipal: telefone,
                    emailPrincipal: email
                )
                resultado.append(item)
            }
            return resultado
        }.value
    }
}
