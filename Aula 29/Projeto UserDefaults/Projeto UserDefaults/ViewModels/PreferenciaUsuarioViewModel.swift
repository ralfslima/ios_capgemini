// Importações
import SwiftUI
import Observation

// Classe
@Observable
@MainActor
class PreferenciaUsuarioViewModel {
    
    // Nome do usuário
    var nomeUsuario: String = "" {
        didSet {
            UserDefaults.standard.set(nomeUsuario, forKey: "nomeUsuarioSalvo")
        }
    }
    
    // Tema escuro
    var temaEscuro: Bool = false {
        didSet {
            UserDefaults.standard.set(temaEscuro, forKey: "temaEscuroSalvo")
        }
    }
    
    // Inicializador
    init() {
        nomeUsuario = UserDefaults.standard.string(forKey: "nomeUsuarioSalvo") ?? ""
        temaEscuro = UserDefaults.standard.bool(forKey: "temaEscuroSalvo")
    }
    
}
