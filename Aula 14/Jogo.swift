import Foundation

struct Jogo {
    // Retorna a dica de distância comparando o palpite com o número secreto
    func obterDica(numeroSecreto: Int, palpite: Int) -> String {
        if palpite == numeroSecreto {
            return "🎉 Parabéns! Você acertou!"
        }
        
        // Calcula a diferença absoluta (sempre positiva)
        let diferenca = abs(palpite - numeroSecreto)
        
        if diferenca <= 5 {
            return "Muito perto!"
        } else if diferenca <= 10 {
            return "Perto!"
        } else if diferenca <= 15 {
            return "Longe!"
        } else {
            return "Muito longe!"
        }
    }
}
