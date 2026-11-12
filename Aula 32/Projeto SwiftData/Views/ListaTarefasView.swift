// Importações
import SwiftUI
import SwiftData

// Struct
struct ListaTarefasView: View {
    
    // ModelContext
    @Environment(\.modelContext) private var modelContext
    
    // ViewModel
    @State private var viewModel: TarefaViewModel?
    
    // Visivilidade da folha (sheet)
    @State private var exibirModal = false
    
    // Body
    var body: some View {
        
        // NavigationStack
        NavigationStack {
            
            // Agrupar estruturas de componentes
            Group {
                
                // Averiguar se a viewModel está devidamente inicializada
                if let viewModel {
                    
                    // Condicional para verificar se há tarefas
                    if viewModel.tarefas.isEmpty {
                        ContentUnavailableView(
                            "Nenhuma tarefa registrada.",
                            systemImage: "calendar.badge.plus",
                            description: Text("Toque no botão + para cadastrar uma nova tarefa.").font(.caption)
                        )
                    } else {
                        // List
                        List {
                            
                            // ForEach
                            ForEach(viewModel.tarefas) { tarefa in
                                
                                // VStack
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(tarefa.titulo)
                                        .font(.title2)
                                    
                                    Text(tarefa.descricao)
                                        .font(.caption)
                                    
                                    HStack {
                                        Image(systemName: "calendar")
                                        Text(tarefa.data.formatted(date: .abbreviated, time: .shortened))
                                    }
                                    .font(.caption2)
                                    .foregroundStyle(.blue)
                                }
                                
                            } // Fim ForEach
                            .onDelete(perform: viewModel.removerTarefa)
                            
                        } // Fim List
                    }
                    
                } else {
                    ProgressView()
                }
            
            } // Fim Group
            .navigationTitle("Lista de tarefas")
            .toolbar {
                ToolbarItem {
                    Button {
                        exibirModal = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $exibirModal) {
                if let viewModel {
                    AdicionarTarefaView(viewModel: viewModel)
                }
            }
            
        } // Fim NavigationStack
        .onAppear {
            // Forçar a inicialização da ViewModel
            if viewModel == nil {
                viewModel = TarefaViewModel(modelContext: modelContext)
            }
        }
        
    }
    
}

// Preview
#Preview {
    ListaTarefasView().modelContainer(for: Tarefa.self, inMemory: true)
}
