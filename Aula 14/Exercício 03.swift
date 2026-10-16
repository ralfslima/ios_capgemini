import SwiftUI

struct ContentView: View {
    // Instância fixa da struct (apenas para usar a função obterDica)
    let mecânicaDoJogo = Jogo()
    
    // Estados que controlam as variáveis do jogo na tela
    @State private var numeroSecreto: Int = Int.random(in: 1...100)
    @State private var palpiteDigitado: String = ""
    @State private var dicaAtual: String = "Digite um número para começar!"
    @State private var tentativas: Int = 0
    @State private var acertou: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
            // Título do Jogo
            Text("Adivinhe o Número")
                .font(.title)
                .bold()
            
            Text("Tente adivinhar o número secreto de 1 até 100")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            // Campo e botão de palpite (só aparecem se ainda NÃO acertou)
            if !acertou {
                TextField("Seu palpite", text: $palpiteDigitado)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 150)
                
                Button(action: {
                    let palpite = Int(palpiteDigitado) ?? 0
                    
                    // Incrementa as tentativas
                    tentativas += 1
                    
                    // Pede a dica para a struct de forma direta
                    dicaAtual = mecânicaDoJogo.obterDica(numeroSecreto: numeroSecreto, palpite: palpite)
                    
                    // Verifica se acertou
                    if palpite == numeroSecreto {
                        acertou = true
                    }
                    
                    // Limpa o campo de texto
                    palpiteDigitado = ""
                }) {
                    Text("Enviar Palpite")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            
            // Área de Feedback / Dica / Resultado
            VStack(spacing: 8) {
                Text(dicaAtual)
                    .font(.headline)
                    .bold()
                    .foregroundColor(acertou ? .green : .primary)
                    .multilineTextAlignment(.center)
                
                if tentativas > 0 {
                    Text("Tentativas realizadas: \(tentativas)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            
            // Botão "Jogar Novamente" (Só aparece QUANDO acertar)
            if acertou {
                Button(action: {
                    // Reinicia as variáveis de estado direto na View
                    numeroSecreto = Int.random(in: 1...100)
                    palpiteDigitado = ""
                    dicaAtual = "Digite um número para começar!"
                    tentativas = 0
                    acertou = false
                }) {
                    Text("Jogar Novamente 🔄")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 10)
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
