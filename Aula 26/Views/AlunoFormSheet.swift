import SwiftUI

struct AlunoFormSheet: View {
    let titulo: String
    let botaoTitulo: String
    
    // 💡 Vincula-se diretamente à struct AlunoFormulario guardada na ViewModel
    @Binding var formulario: AlunoFormulario
    
    // Ação que será executada quando o usuário clicar no botão principal (cadastrar ou editar)
    var acaoPrincipal: () -> Void
    
    // Permite fechar a folha modal via código
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Informações do aluno") {
                    TextField("Nome", text: $formulario.nome)
                        .autocorrectionDisabled()
 
                    TextField("Nota 1 (Ex: 8,5)", text: $formulario.nota1)
                        .keyboardType(.decimalPad)
                    
                    TextField("Nota 2 (Ex: 7,0)", text: $formulario.nota2)
                        .keyboardType(.decimalPad)
                }
                
                Button(action: acaoPrincipal) {
                    Text(botaoTitulo)
                        .frame(maxWidth: .infinity)
                        .fontWeight(.semibold)
                }
                .buttonStyle(.borderedProminent)
                .listRowBackground(Color.clear)
            }
            .navigationTitle(titulo)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
            }
        }
    }
}
