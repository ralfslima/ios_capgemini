import CoreLocation
import SwiftUI

@Observable
class GerenciadorLocalizacao: NSObject, CLLocationManagerDelegate {
    var localizacaoAtual: CLLocationCoordinate2D?
    var statusPermissao: CLAuthorizationStatus = .notDetermined
    var erroMensagem: String?
    
    private let manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func solicitarLocalizacao() {
        // Verifica o status atual antes de agir
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            manager.startUpdatingLocation()
        case .denied, .restricted:
            erroMensagem = "Permissão negada. Ative nos Ajustes do Simulador."
        @unknown default:
            break
        }
    }
    
    // Chamado automaticamente quando o usuário responde ao pop-up de permissão
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        statusPermissao = manager.authorizationStatus
        
        if statusPermissao == .authorizedWhenInUse || statusPermissao == .authorizedAlways {
            erroMensagem = nil
            manager.startUpdatingLocation()
        } else if statusPermissao == .denied {
            erroMensagem = "Permissão de localização negada."
        }
    }
    
    // Chamado sempre que o GPS recebe uma nova coordenada
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let ultimaLocalizacao = locations.last else { return }
        localizacaoAtual = ultimaLocalizacao.coordinate
        
        // Para de atualizar continuamente para economizar bateria (remova se quiser rastreamento contínuo)
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        erroMensagem = "Erro ao obter GPS: \(error.localizedDescription)"
    }
}
