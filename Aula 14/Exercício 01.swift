import SwiftUI

struct ContentView: View {
    // Referenciar objeto aluno
    @State private var aluno = Aluno()
    
    // Referência para exibir e ocultar a média e a situação
    @State private var mostrarResultado: Bool = false
    
    // Body
    var body: some View {
        
        // VStack
        VStack {
            // Título + ícone
            Image(systemName: "graduationcap.circle.fill")
                .foregroundStyle(.blue)
                .font(.system(size: 150))
            
            Text("Exercício 01")
                .font(.title)
                .bold()
            
            // Formulário
            Form {
                // Nome do aluno
                TextField("Nome", text: $aluno.nome)
                
                // Nota 1
                TextField("1ª Nota", text: $aluno.nota1)
                
                // Nota 2
                TextField("2ª Nota", text: $aluno.nota2)
                
                // Botões para calcular e efetuar o reset
                if mostrarResultado {
                    Button(action: {
                        mostrarResultado = !true
                        
                        aluno = Aluno()
                    }) {
                        Text("Avaliar outro aluno")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.orange)
                            .foregroundStyle(.white)
                            .cornerRadius(10)
                    }
                } else {
                    Button(action: {
                        mostrarResultado = true
                    }) {
                        Text("Calcular")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.blue)
                            .foregroundStyle(.white)
                            .cornerRadius(10)
                    }
                }
            }
            
            
            // Exibir o nome do aluno, média e situação
            if mostrarResultado {
                VStack {
                    Text("Nome: \(aluno.nome)")
                    
                    Text("Média: \(String(format: "%.1f", (aluno.media)))")
                    
                    Text("Situação: \(aluno.situacao)")
                        .foregroundStyle(aluno.cor)
                }
            }
            
            // Espaçamento para empurrar os componentes para o topo
            Spacer()
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
