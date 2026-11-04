import SwiftUI

struct AlunoView: View {
    // 💡 Instancia a ViewModel usando a abordagem moderna do @Observable (iOS 17+)
    @State private var viewModel = AlunoViewModel()
       
   // 2. Controles de abertura das folhas modais (Sheets)
   @State private var exibirCadastro = false
   @State private var exibirEdicao = false 
       
   // 3. Controles para exibição do Alerta de erro (Abordagem da Opção 1 com booleano)
   @State private var exibirAlerta = false
   @State private var mensagemErro = ""

    
    var body: some View {
        NavigationStack {
            List {
                if viewModel.alunos.isEmpty {
                    ContentUnavailableView(
                        "Nenhum Aluno",
                        systemImage: "person.3",
                        description: Text("Toque no botão + para cadastrar o primeiro.")
                    )
                } else {
                    ForEach(viewModel.alunos) { aluno in
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(aluno.nome)
                                    .font(.headline)
                                Text("Média: \(aluno.media, specifier: "%.1f")")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            // Badges com a situação (Aprovado / Reprovado)
                            Text(aluno.situacao)
                                .font(.caption)
                                .fontWeight(.bold)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(aluno.media >= 7.0 ? Color.green.opacity(0.2) : Color.red.opacity(0.2))
                                .foregroundColor(aluno.media >= 7.0 ? .green : .red)
                                .cornerRadius(8)
                        }
                        // 💡 Ao tocar no aluno, prepara o formulário e abre a edição
                        .contentShape(Rectangle())
                        .onTapGesture {
                            viewModel.selecionarAlunoEdicao(aluno: aluno)
                            exibirEdicao = true
                        }
                    }
                    // 💡 O onDelete chama diretamente a função da ViewModel sem precisar de closures extras
                    .onDelete(perform: viewModel.remover)
                }
            }
            .navigationTitle("Lista de Alunos")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        exibirCadastro = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            // Sheet de Cadastro
            .sheet(isPresented: $exibirCadastro) {
                AlunoFormSheet(
                    titulo: "Novo Aluno",
                    botaoTitulo: "Cadastrar",
                    formulario: $viewModel.formularioCadastro
                ) {
                    if let erro = viewModel.cadastrar() {
                        mensagemErro = erro
                        exibirAlerta = true
                    } else {
                        exibirCadastro = false
                    }
                }
            }
            // Sheet de Edição
            .sheet(isPresented: $exibirEdicao) {
                AlunoFormSheet(
                    titulo: "Editar Aluno",
                    botaoTitulo: "Salvar Alterações",
                    formulario: $viewModel.formularioEdicao,
                    acaoPrincipal: {
                        if let erro = viewModel.editar() {
                            mensagemErro = erro
                            exibirAlerta = true
                        } else {
                            exibirEdicao = false
                        }
                    }
                )
            }
            // Alerta genérico de erro caso a validação do converter() falhe
            .alert("Atenção", isPresented: $exibirAlerta) {
                Button("OK", role: .cancel) { }
            } message: {
                // Exibe o texto da mensagem de erro diretamente na tela
                Text(mensagemErro)
            }
        }
    }
}

#Preview {
    AlunoView()
}
