// Import o SwiftUI
import SwiftUI

// Struct
struct PostagemView: View {
    
    // Objeto para referenciar a ViewModel
    @State private var viewModel = PostagemViewModel()
    
    // Variáveis para obter o título e o texto da postagem
    @State private var titulo = ""
    @State private var texto = ""
    
    // Body
    var body: some View {
        
        // NavigationStack
        NavigationStack {
            
            // VStack
            VStack(spacing: 0) {
                
                // Form
                Form {
                    TextField("Título", text: $titulo)
                    
                    TextField("Texto da Postagem", text: $texto, axis: .vertical)
                        .lineLimit(3...5)
                    
                    Button {
                        Task {
                            await viewModel.cadastrar(titulo: titulo, texto: texto)
                        }
                    } label: {
                        Text("Cadastrar")
                    }
                    .buttonStyle(.borderedProminent)
                } // Fim Form
                .frame(height: 210)
                
                // List
                List {
                    
                    // Section
                    Section {
                        
                        // Condicional
                        if viewModel.postagens.isEmpty && viewModel.estaCarregando {
                            ProgressView("Carregando...")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        } else if viewModel.postagens.isEmpty {
                            ContentUnavailableView(
                                "Nenhum postagem encontrada!",
                                systemImage: "exclamationmark.octagon"
                            )
                        } else {
                            // ForEach
                            ForEach(viewModel.postagens) { postagem in
                                
                                // VStack
                                VStack(alignment: .leading, spacing: 15) {
                                    Text(postagem.titulo)
                                        .font(.headline)
                                    
                                    Text(postagem.texto)
                                        .font(.subheadline)
                                        .foregroundStyle(.gray)
                                    
                                    // HStack
                                    HStack {
                                        Text("Código usuário: \(postagem.idUsuario)")
                                            .font(.caption)
                                            .foregroundStyle(.blue)
                                        
                                        Spacer()
                                        
                                        Text("Código postagem: \(postagem.idServidor)")
                                            .font(.caption)
                                            .foregroundStyle(.red)
                                    } // Fim HStack
                                } // Fim VStack
                                
                            } // Fim ForEach
                            .onDelete { offsets in Task {
                                await viewModel.remover(offsets: offsets)
                            } }
                        }
                        
                    } // Fim Section
                    
                } // Fim List
                
            } // Fim VStack
            .navigationTitle("Postagens")
            .task { // <- Task é utilizado para carregar/executar funções assíncronas
                await viewModel.carregarPostagens()
            }
            
        } // Fim NavigationStack
        
    }
    
}

// Preview
#Preview {
    PostagemView()
}
