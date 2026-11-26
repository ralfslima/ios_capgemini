/*
1. Clique no projeto
2. Acesse a aba info
3. Adicione a chave Privacy - Location When In Use Usage Description e defina um valor qualquer
 
 -----------
 
 Precisamos definir uma localização para o nosso simulador.
 1. Product
 2. Scheme -> Edit Scheme
 3. Run
 4. Options
 5. Selecione uma cidade/estado/país
*/

import MapKit
import SwiftUI

struct ContentView: View {
    @State private var gerenciador = GerenciadorLocalizacao()
    @State private var posicaoCamera: MapCameraPosition = .automatic
    
    var body: some View {
        VStack(spacing: 16) {
            // Mapa nativo do SwiftUI
            Map(position: $posicaoCamera) {
                UserAnnotation() // Mostra a bolinha azul da localização atual
            }
            .mapControls {
                MapUserLocationButton() // Botão nativo para centralizar no usuário
                MapCompass()
            }
            .frame(height: 350)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal)
            
            // Exibição das coordenadas
            if let coord = gerenciador.localizacaoAtual {
                VStack(spacing: 4) {
                    Text("Coordenadas Capturadas:")
                        .font(.headline)
                    Text("Latitude: \(coord.latitude, specifier: "%.5f")")
                    Text("Longitude: \(coord.longitude, specifier: "%.5f")")
                }
                .font(.subheadline)
                .padding()
                .background(Color.secondary.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            } else if let erro = gerenciador.erroMensagem {
                Text(erro)
                    .foregroundStyle(.red)
                    .font(.callout)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            Button("Obter Minha Localização") {
                gerenciador.solicitarLocalizacao()
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
        // Centraliza o mapa suavemente assim que a coordenada chega
        .onChange(of: gerenciador.localizacaoAtual?.latitude) {
            if let coord = gerenciador.localizacaoAtual {
                withAnimation {
                    posicaoCamera = .region(
                        MKCoordinateRegion(
                            center: coord,
                            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                        )
                    )
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
