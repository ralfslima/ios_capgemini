import SwiftUI

struct ContentView: View {
    // Estados para os campos de texto atuais
    @State private var nomeDigitado: String = ""
    @State private var cidadeDigitada: String = ""
    
    // Lista de pessoas que começa vazia
    @State private var listaDePessoas: [Pessoa] = []
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            Text("Cadastro de Pessoas")
                .font(.title)
                .bold()
            
            // Campos de Entrada de Dados
            TextField("Nome", text: $nomeDigitado)
                .textFieldStyle(.roundedBorder)
            
            TextField("Cidade", text: $cidadeDigitada)
                .textFieldStyle(.roundedBorder)
            
            // Botão para Adicionar
            Button(action: {
                // Cria uma nova pessoa com os textos digitados
                let novaPessoa = Pessoa(nome: nomeDigitado, cidade: cidadeDigitada)
                
                // Adiciona na nossa lista
                listaDePessoas.append(novaPessoa)
                
                // Limpa os campos após adicionar
                nomeDigitado = ""
                cidadeDigitada = ""
            }) {
                Text("Adicionar Pessoa")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            // Lista que exibe as pessoas cadastradas
            List(listaDePessoas) { pessoa in
                HStack {
                    VStack(alignment: .leading) {
                        Text(pessoa.nome)
                            .font(.headline)
                        Text(pessoa.cidade)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer() // Empurra o botão de remover para a direita
                    
                    // Botão convencional para remover a pessoa da lista
                    Button(action: {
                        // Remove a pessoa filtrando a lista para manter apenas quem tem o ID diferente
                        listaDePessoas.removeAll { $0.id == pessoa.id }
                    }) {
                        Text("Remover")
                            .font(.footnote)
                            .foregroundColor(.red)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color.red.opacity(0.1))
                            .cornerRadius(5)
                    }
                    .buttonStyle(.plain) // Evita que o clique na linha inteira ative o botão
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
