// Importações
import SwiftUI
import SwiftData

// Struct
struct AdicionarTarefaView: View {
    
    // Fechamento da folha
    @Environment(\.dismiss) private var fechar
    
    // Referenciar ViewModel do ListaTarefasView
    @Bindable var viewModel: TarefaViewModel
    
    // Body
    var body: some View {
        
        // NavigationStack
        NavigationStack {
            
            // Form
            Form {
                
                TextField("Título", text: $viewModel.titulo)
                
                TextField("Descrição", text: $viewModel.descricao)
                
                DatePicker("Data", selection: $viewModel.data)
                
            } // Fim Form
            .navigationTitle("Cadastrar tarefa")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Fechar") {
                        fechar()
                    }
                }
                
                ToolbarItem {
                    Button("Cadastrar") {
                        viewModel.cadastrarTarefa()
                        fechar()
                    }
                }
            }
            
        } // Fim NavigationStack
        
    }
    
}
