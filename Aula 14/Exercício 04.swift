import SwiftUI


struct ContentView: View {
    // Instância da struct de conversão
    let conversor = Conversor()
    
    // Estados para controlar a tela
    @State private var valorDigitado: String = ""
    @State private var resultadoFormatado: String = "Digite um valor e escolha a conversão"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            // Título Principal
            Text("Conversor de Moedas")
                .font(.title)
                .bold()
            
            Text("Digite o valor desejado:")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            // Campo de entrada de texto
            TextField("Ex: 100.00", text: $valorDigitado)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
            
            Text("Selecione a conversão:")
                .font(.headline)
                .padding(.top, 5)
            
            // Grade de Botões de Conversão (2 por linha)
            VStack(spacing: 10) {
                HStack(spacing: 10) {
                    // Botão Real -> Dólar
                    Button(action: {
                        let valor = Double(valorDigitado.replacingOccurrences(of: ",", with: ".")) ?? 0.0
                        let convertido = conversor.realParaDolar(valor: valor)
                        resultadoFormatado = String(format: "R$ %.2f = $ %.2f", valor, convertido)
                    }) {
                        Text("Real ➡️ Dólar")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green.opacity(0.2))
                            .foregroundColor(.green)
                            .cornerRadius(10)
                    }
                    
                    // Botão Real -> Euro
                    Button(action: {
                        let valor = Double(valorDigitado.replacingOccurrences(of: ",", with: ".")) ?? 0.0
                        let convertido = conversor.realParaEuro(valor: valor)
                        resultadoFormatado = String(format: "R$ %.2f = € %.2f", valor, convertido)
                    }) {
                        Text("Real ➡️ Euro")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue.opacity(0.2))
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                    }
                }
                
                HStack(spacing: 10) {
                    // Botão Dólar -> Real
                    Button(action: {
                        let valor = Double(valorDigitado.replacingOccurrences(of: ",", with: ".")) ?? 0.0
                        let convertido = conversor.dolarParaReal(valor: valor)
                        resultadoFormatado = String(format: "$ %.2f = R$ %.2f", valor, convertido)
                    }) {
                        Text("Dólar ➡️ Real")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    // Botão Euro -> Real
                    Button(action: {
                        let valor = Double(valorDigitado.replacingOccurrences(of: ",", with: ".")) ?? 0.0
                        let convertido = conversor.euroParaReal(valor: valor)
                        resultadoFormatado = String(format: "€ %.2f = R$ %.2f", valor, convertido)
                    }) {
                        Text("Euro ➡️ Real")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            
            // Área de Exibição do Resultado
            VStack {
                Text(resultadoFormatado)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
            }
            .padding(.top, 15)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


