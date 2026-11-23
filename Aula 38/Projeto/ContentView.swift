// Importar SwiftUI
import SwiftUI

// Importar o Observation
import Observation

// Regras de negócios (ViewModels)
@Observable
class IncrementadorViewModel {
    // Variável contador
    var contador = 0
    
    // Função para incrementar o contador
    func incrementar() {
        contador += 1
    }
    
    // Função para zerar o contador
    func zerarContador() {
        contador = 0
    }
}

// Estrutura de Tela
struct ContentView: View {
    
    // Referênciar objeto da ViewModel
    @State private var viewModel = IncrementadorViewModel()
    
    // Body
    var body: some View {
        
        // VStack
        VStack {
            
            // Exibir o valor da variável contador
            Text("Contador: \(viewModel.contador)")
                .font(.largeTitle)
                .accessibilityIdentifier("TextoContador")
            
            // Botão para incrementar o contador
            Button("Incrementar") {
                viewModel.incrementar()
            }
            .buttonStyle(.borderedProminent)
            .accessibilityIdentifier("BotaoIncrementar")
            
            // Botão para zerar o contador
            Button("Zerar contador") {
                viewModel.zerarContador()
            }
            .buttonStyle(.glass)
            .accessibilityIdentifier("BotaoZerar")
            
        } // Fim VStack
        
    }
}

// Canva
#Preview {
    ContentView()
}
