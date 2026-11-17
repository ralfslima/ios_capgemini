
import SwiftUI

struct CadastroView: View {
    
    @Bindable var viewModel: EnderecoViewModel
    
    var body: some View {
        
        TabView {
            
            // MARK: - ABA CADASTRO
            
            formulario
                .tabItem {
                    Label("Cadastro", systemImage: "person.crop.circle.badge.plus")
                }
            
            // MARK: - ABA LISTAGEM
            
            listagem
                .tabItem {
                    Label("Endereços", systemImage: "list.bullet")
                }
        }
        .alert(
            "Atenção",
            isPresented: $viewModel.mostrarErro
        ) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(viewModel.mensagemErro)
        }
    }
    
    // MARK: - FORMULÁRIO
    
    private var formulario: some View {
        
        NavigationStack {
            
            Form {
                
                Section("Dados do usuário") {
                    
                    TextField("Nome completo", text: $viewModel.nome)
                    
                    TextField("CEP", text: $viewModel.cep)
                        .keyboardType(.numberPad)
                        .onChange(of: viewModel.cep) { _, novoValor in
                            
                            let filtrado = String(
                                novoValor.filter(\.isNumber).prefix(8)
                            )
                            
                            if filtrado != novoValor {
                                viewModel.cep = filtrado
                            }
                        }
                        .task(id: viewModel.cep) {
                            
                            guard viewModel.cep.count == 8 else {
                                return
                            }
                            
                            do {
                                try await Task.sleep(
                                    for: .milliseconds(400)
                                )
                            } catch {
                                return
                            }
                            
                            await viewModel.consultarCEP()
                        }
                    
                    if viewModel.buscandoCEP {
                        ProgressView("Consultando CEP...")
                    }
                }
                
                Section("Endereço") {
                    
                    TextField("Estado", text: $viewModel.estado)
                    
                    TextField("Cidade", text: $viewModel.cidade)
                    
                    TextField("Bairro", text: $viewModel.bairro)
                    
                    TextField("Logradouro", text: $viewModel.logradouro)
                    
                    TextField("Número", text: $viewModel.numero)
                        .keyboardType(.numberPad)
                }
                
                Section {
                    
                    Button {
                        viewModel.cadastrar()
                    } label: {
                        Label(
                            "Cadastrar endereço",
                            systemImage: "plus.circle.fill"
                        )
                        .frame(maxWidth: .infinity)
                    }
                    .disabled(viewModel.buscandoCEP)
                }
            }
            .navigationTitle("Novo Cadastro")
        }
    }
    
    // MARK: - LISTAGEM
    
    private var listagem: some View {
        
        NavigationStack {
            
            List {
                
                if viewModel.enderecos.isEmpty {
                    
                    ContentUnavailableView(
                        "Nenhum endereço cadastrado",
                        systemImage: "house",
                        description: Text(
                            "Os endereços cadastrados aparecerão aqui."
                        )
                    )
                    
                } else {
                    
                    ForEach(viewModel.enderecos) { endereco in
                        
                        VStack(alignment: .leading, spacing: 6) {
                            
                            Text(endereco.nome)
                                .font(.headline)
                            
                            Label(
                                "\(endereco.logradouro), \(endereco.numero)",
                                systemImage: "mappin"
                            )
                            
                            Text(
                                "\(endereco.bairro) - \(endereco.cidade)/\(endereco.estado)"
                            )
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            
                            Text("CEP: \(endereco.cep)")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 5)
                        .swipeActions(edge: .trailing) {
                            
                            Button(role: .destructive) {
                                viewModel.remover(endereco)
                            } label: {
                                Label("Excluir", systemImage: "trash")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Meus Endereços")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Text("\(viewModel.enderecos.count) registros")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

// MARK: - PREVIEW

#Preview {
    CadastroView(
        viewModel: EnderecoViewModel()
    )
}
