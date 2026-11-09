// Importar SwiftUI
import SwiftUI

// Estrutura
struct ContentView: View {
    // Variáveis
    @AppStorage("nomeUsuario") private var nomeUsuario: String = ""
    @AppStorage("temaEscuro")  private var temaEscuro: Bool = false
    
    // Body
    var body: some View {

        // NavigationStack
        NavigationStack {
            
            // Form
            Form {
                
                // Section #1
                Section(header: Text("Perfil")) {
                    TextField("Informe o nome do usuário", text: $nomeUsuario)
                }
                
                // Section #2
                Section(header: Text("Tema")) {
                    Toggle("Modo escuro", isOn: $temaEscuro)
                }
                
                // Section #3
                Section(header: Text("Apresentação")) {
                    Text("Olá, \(nomeUsuario.isEmpty ? "visitante" : nomeUsuario).")
                }
                
            } // Fim Form
            .navigationTitle("Configurações")
            .preferredColorScheme(temaEscuro ? .dark : .light)
            
        } // Fim NavigationStack
        
    }
}

// Preview
#Preview {
    ContentView()
}
