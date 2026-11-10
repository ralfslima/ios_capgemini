// Importar o SwiftUI
import SwiftUI

// Struct - Principal
struct PessoaView: View {
    
    // ViewModel
    @State private var viewModel = PessoaViewModel()
    
    // Body
    var body: some View {
        
        // NavigationStack
        NavigationStack {
            VStack{
                FormularioView()
                BotaoSalvarView()
                ListagemView()
            }
            .navigationTitle("FileManager")
        }
        
        
    }
    
}

// Struct - Formulário
private struct FormularioView: View {
    
    @State private var nome: String
    
    // Body
    var body: some View {
        
        // Form
        Form {
            
            //TextField("Nome", text: "")
            
        } // Fim Form
        
    }
    
}

// Struct - Botão para salvar/cadastrar
private struct BotaoSalvarView: View {
    
    // Body
    var body: some View {
        Text("Botão Salvar")
    }
    
}

// Struct - Listagem
private struct ListagemView: View {
    
    // Body
    var body: some View {
        Text("Listagem")
    }
    
}

// Preview
#Preview {
    PessoaView()
}
