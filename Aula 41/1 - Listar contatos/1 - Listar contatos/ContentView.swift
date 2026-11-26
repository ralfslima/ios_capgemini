/*
1. Clique no projeto
2. Acesse a aba info
3. Adicione a chave Privacy - Contacts Usage Description e defina um valor qualquer
*/
import SwiftUI

struct ContentView: View {
    @State private var viewModel = ContatosViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.carregando {
                    ProgressView("Buscando contatos...")
                } else if viewModel.permissaoNegada {
                    ContentUnavailableView {
                        Label("Acesso Negado", systemImage: "person.crop.circle.badge.exclamationmark")
                    } description: {
                        Text("Permita o acesso aos contatos nos Ajustes para visualizar sua lista.")
                    } actions: {
                        Button("Abrir Ajustes") {
                            if let url = URL(string: UIApplication.openSettingsURLString) {
                                UIApplication.shared.open(url)
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                } else {
                    List(viewModel.contatos) { contato in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(contato.nomeCompleto)
                                .font(.headline)
                            
                            if let telefone = contato.telefonePrincipal {
                                Text(telefone)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                            
                            if let email = contato.emailPrincipal {
                                Text(email)
                                    .font(.caption)
                                    .foregroundStyle(.blue)
                            }
                        }
                        .padding(.vertical, 2)
                    }
                }
            }
            .navigationTitle("Contatos")
            .task {
                await viewModel.carregarContatos()
            }
        }
    }
}

#Preview {
    ContentView()
}
