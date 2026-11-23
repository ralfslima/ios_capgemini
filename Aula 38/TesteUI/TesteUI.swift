// Importar biblioteca XCTest
import XCTest

// Classe
final class TesteUI: XCTestCase {

    // Função que será executada antes dos testes
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    // Teste principal
    @MainActor
    func testeGeral() throws {
        // Executar o emulador/simulador
        let app = XCUIApplication()
        app.launch()

        // Extrair cada elemento da UI
        //let textoContador = app.label["TextoContador"]            <- Label
        let textoContador = app.staticTexts["TextoContador"]     // <- Identifier
        let botaoIncrementar = app.buttons["BotaoIncrementar"]   // <- Indentifier
        let botaoZerar = app.buttons["BotaoZerar"]
        
        // Verificar a existência dos elementos de UI
        XCTAssert(textoContador.exists,    "O Text não existe!")
        XCTAssert(botaoIncrementar.exists, "O botão para incrementar não existe!")
        XCTAssert(botaoZerar.exists,       "O botão para zerar não existe!")
        
        // Verificar o valor inicial do Text
        XCTAssertEqual(textoContador.label, "Contador: 0")
        
        // Efetuar três incrementos
        botaoIncrementar.tap()
        botaoIncrementar.tap()
        botaoIncrementar.tap()
        
        // Verificar o valor do contador é igual a 3
        XCTAssertEqual(textoContador.label, "Contador: 3")
        
        // Efetuar o reset
        botaoZerar.tap()
        
        // Verificar o valor do contador é igual a 0
        XCTAssertEqual(textoContador.label, "Contador: 0")
        
    }

}
