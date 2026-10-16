import Foundation

struct Conversor {
    // Taxas de conversão fixas para facilitar os testes dos alunos
    let taxaDolar: Double = 5.00
    let taxaEuro: Double = 5.50
    
    func realParaDolar(valor: Double) -> Double {
        return valor / taxaDolar
    }
    
    func realParaEuro(valor: Double) -> Double {
        return valor / taxaEuro
    }
    
    func dolarParaReal(valor: Double) -> Double {
        return valor * taxaDolar
    }
    
    func euroParaReal(valor: Double) -> Double {
        return valor * taxaEuro
    }
}
