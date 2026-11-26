import SwiftUI

struct ContentView: View {
    @State private var statusMensagem = "Clique no botão para testar"
    
    // Inicializa o delegate assim que a tela abre
    private let gerenciador = GerenciadorNotificacoes.shared
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "bell.badge.fill")
                .font(.system(size: 60))
                .foregroundStyle(.blue)
            
            Text(statusMensagem)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Button("Enviar Notificação") {
                Task {
                    let autorizado = await gerenciador.pedirPermissao()
                    
                    if autorizado {
                        gerenciador.dispararNotificacaoLocal()
                        statusMensagem = "Notificação agendada! Aguarde 2 segundos..."
                    } else {
                        statusMensagem = "Permissão negada. Ative nos Ajustes do Simulador."
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
