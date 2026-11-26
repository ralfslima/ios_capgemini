/*
1. Clique no projeto
2. Acesse a aba info
3. Adicione a chave Privacy - Face ID Usage Description e defina um valor qualquer
 
Quando estiver no simulador, vá na opção Device -> Face ID para liberar o acesso.
*/

import LocalAuthentication
import SwiftUI

struct ContentView: View {
    @State private var desbloqueado = false
    @State private var mensagemStatus = "Conteúdo bloqueado"
    
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: desbloqueado ? "lock.open.fill" : "lock.fill")
                .font(.system(size: 64))
                .foregroundStyle(desbloqueado ? .green : .red)
                .contentTransition(.symbolEffect(.replace))
            
            Text(mensagemStatus)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            if !desbloqueado {
                Button("Autenticar com Biometria") {
                    autenticar()
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            } else {
                Button("Bloquear Novamente") {
                    desbloqueado = false
                    mensagemStatus = "Conteúdo bloqueado"
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
    }
    
    private func autenticar() {
        let context = LAContext()
        var error: NSError?
        
        // Verifica se o aparelho/simulador tem biometria cadastrada
        // Dica: Use .deviceOwnerAuthentication se quiser permitir a senha do iPhone caso a biometria falhe
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let motivo = "Confirme sua identidade para acessar esta área."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: motivo) { sucesso, erroAutenticacao in
                // Garante a atualização da interface na thread principal
                Task { @MainActor in
                    if sucesso {
                        desbloqueado = true
                        mensagemStatus = "Autenticado com sucesso! 🎉"
                    } else {
                        mensagemStatus = "Falha na autenticação: \(erroAutenticacao?.localizedDescription ?? "Erro desconhecido")"
                    }
                }
            }
        } else {
            // Cai aqui se o simulador estiver com o Face ID / Touch ID desativado ("Not Enrolled")
            mensagemStatus = "Biometria indisponível ou não cadastrada no Simulador."
        }
    }
}

#Preview {
    ContentView()
}
