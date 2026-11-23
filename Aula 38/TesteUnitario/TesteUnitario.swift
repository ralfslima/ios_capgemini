// Importar biblioteca de testes unitários
import Testing

// Referenciar a pasta do projeto onde está a ViewModel
@testable import Projeto

// Struct
struct TesteUnitario {

    @Test("Verificar se o contador está sendo inicializado com zero")
    func verificarValorInicialContador() throws {
        // Carregar a estrutura da ViewModel
        let viewModel = IncrementadorViewModel()
        
        // Verificação
        #expect(viewModel.contador == 0)
    }
    
    @Test("Verificar se a função incrementar está adicionando +1")
    func verificarIncremento() {
        // Carregar a estrutura da ViewModel
        let viewModel = IncrementadorViewModel()
        
        // Executar a função para incrementador +1
        viewModel.incrementar()
        
        // Verificação
        #expect(viewModel.contador == 1)
    }

    @Test("Verificar a função zerarContador")
    func verificarZerarContador() {
        // Carregar a estrutura da ViewModel
        let viewModel = IncrementadorViewModel()
        
        // Executar a função para incrementador +1
        viewModel.incrementar()
        
        // Verificação
        #expect(viewModel.contador == 1)
        
        // Executar a função zerarContador
        viewModel.zerarContador()
        
        // Verificação
        #expect(viewModel.contador == 0)
    }
    
}
