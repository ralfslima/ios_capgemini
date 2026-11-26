import Foundation
import UserNotifications

class GerenciadorNotificacoes: NSObject, UNUserNotificationCenterDelegate {
    static let shared = GerenciadorNotificacoes()
    
    override init() {
        super.init()
        // Define esta classe como delegate para mostrar a notificação mesmo com o app aberto
        UNUserNotificationCenter.current().delegate = self
    }
    
    func pedirPermissao() async -> Bool {
        do {
            let autorizado = try await UNUserNotificationCenter.current()
                .requestAuthorization(options: [.alert, .sound, .badge])
            return autorizado
        } catch {
            print("Erro ao pedir permissão: \(error.localizedDescription)")
            return false
        }
    }
    
    func dispararNotificacaoLocal() {
        let conteudo = UNMutableNotificationContent()
        conteudo.title = "Olá! 👋"
        conteudo.subtitle = "Teste no Simulador"
        conteudo.body = "Sua notificação local funcionou perfeitamente!"
        conteudo.sound = .default
        
        // Dispara em 2 segundos (o mínimo exigido pelo iOS é > 0)
        let gatilho = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        
        let requisicao = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: conteudo,
            trigger: gatilho
        )
        
        UNUserNotificationCenter.current().add(requisicao) { erro in
            if let erro {
                print("Erro ao agendar notificação: \(erro.localizedDescription)")
            }
        }
    }
    
    // Permite que o banner apareça no topo da tela mesmo com o app em primeiro plano
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification
    ) async -> UNNotificationPresentationOptions {
        return [.banner, .sound]
    }
}
