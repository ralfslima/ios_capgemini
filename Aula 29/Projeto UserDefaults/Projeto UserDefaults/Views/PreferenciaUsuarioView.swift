// Importação
import SwiftUI

// Struct
struct PreferenciaUsuarioView: View {
    
    // Referência com a classe PreferenciaUsuarioViewModel
    @State private var viewModel = PreferenciaUsuarioViewModel()
    
    // Corpo da tela
    var body: some View {
        
        // NavigationStack
        NavigationStack {
            
            // Form
            Form {
                
                // Section #1
                Section(header: Text("Perfil")) {
                    TextField("Informe o nome do usuário", text: $viewModel.nomeUsuario)
                }
                
                // Section #2
                Section(header: Text("Tema")) {
                    Toggle("Modo escuro", isOn: $viewModel.temaEscuro)
                }
                
                // Section #3
                Section(header: Text("Apresentação")) {
                    Text("Olá, \(viewModel.nomeUsuario.isEmpty ? "visitante" : viewModel.nomeUsuario).")
                }
                
            } // Fim Form
            .navigationTitle("Configurações")
            .preferredColorScheme(viewModel.temaEscuro ? .dark : .light)
            
        } // Fim NavigationStack
        
        
    }
    
}
