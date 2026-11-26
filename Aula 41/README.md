# 📱 Guia de Recursos Nativos iOS: Simulador vs. iPhone Físico

Guia prático de referência para desenvolvimento em **SwiftUI** utilizando o **Xcode 27.2** e o simulador do **iPhone 18 Pro**.

---

## ✅ Recursos que funcionam no simulador (iPhone 18 Pro)

O Simulador do Xcode emula grande parte das APIs de software e privacidade do iOS, permitindo validar fluxos completos sem um dispositivo físico.

| Funcionalidade | O que faz | Como testar no Simulador | Documentação Oficial |
| :--- | :--- | :--- | :--- |
| **Contatos (`Contacts`)** | Lê, cria e filtra contatos da agenda do usuário (com suporte a acesso total ou limitado). | Arraste um arquivo `.vcf` para a tela do simulador para importar contatos extras. | [Apple Developer - Contacts](https://developer.apple.com/documentation/contacts) |
| **Biometria (`LocalAuthentication`)** | Autentica o usuário usando Face ID (no iPhone 18 Pro) ou senha do aparelho. | Menu **Device > Face ID > Enrolled**, depois **Matching Face** (`⌥ + ⌘ + M`). | [Apple Developer - Logging a User into Your App with Face ID or Touch ID](https://developer.apple.com/documentation/localauthentication/logging-a-user-into-your-app-with-face-id-or-touch-id) |
| **Geolocalização (`CoreLocation` & `MapKit`)** | Obtém coordenadas GPS, exibe mapas interativos e rastreia rotas em movimento. | Menu **Features > Location** (ou **Device > Location**) e escolha *Custom Location* ou *City Run*. | [Apple Developer - Core Location](https://developer.apple.com/documentation/corelocation) |
| **Notificações Locais e Push (`UserNotifications`)** | Agenda alertas locais ou recebe notificações remotas simuladas na central de notificações. | Agende via código ou arraste um arquivo `.apns` diretamente para a tela do simulador. | [Apple Developer - User Notifications](https://developer.apple.com/documentation/usernotifications) |
| **Galeria de Fotos (`PhotosUI`)** | Permite ao usuário selecionar imagens e vídeos de forma segura sem acesso total à biblioteca. | Arraste imagens ou vídeos do Mac diretamente para o simulador para popular o app Fotos. | [Apple Developer - PhotosPicker](https://developer.apple.com/documentation/photosui/photospicker) |
| **Armazenamento Seguro (`Keychain` & `SwiftData`)** | Salva tokens criptografados no Keychain e persiste bancos de dados locais estruturados. | Funciona nativamente como no dispositivo real. | [Apple Developer - Keychain Services](https://apple.com) |
| **Compras In-App (`StoreKit 2`)** | Simula assinaturas, compras consumíveis, reembolsos e renovações de planos. | Crie um arquivo `.storekit` no Xcode e vincule nas configurações do *Scheme*. | [Apple Developer - StoreKit](https://developer.apple.com/documentation/storekit) |
| **Atalhos e Siri (`AppIntents`)** | Expõe ações do seu app para o app Atalhos, Spotlight e comandos de voz da Siri. | Execute pelo app **Atalhos (Shortcuts)** instalado no próprio simulador. | [Apple Developer - App Intents](https://developer.apple.com/documentation/appintents) |
| **Widgets e Live Activities (`WidgetKit`)** | Exibe widgets na Tela de Início e atividades ao vivo na Ilha Dinâmica (Dynamic Island) do iPhone 18 Pro. | Rode o target do Widget ou dispare uma Live Activity pelo app principal. | [Apple Developer - Creating a Widget Extension](https://apple.com) |

---

## ❌ Recursos que exigem um iPhone físico

Recursos que dependem diretamente de sensores físicos, chips de rádio frequência ou hardware dedicado não são emulados no Mac e exigem um dispositivo real conectado.

| Funcionalidade | O que faz | Por que exige iPhone físico | Documentação Oficial |
| :--- | :--- | :--- | :--- |
| **Câmera e Escaneamento (`AVFoundation` / `VisionKit`)** | Captura fotos, grava vídeos, lê códigos de barras/QR Code e digitaliza documentos. | O simulador não possui lente física nem emula a webcam do Mac como câmera traseira/frontal. | [Apple Developer - Capture Setup](https://apple.com) |
| **Bluetooth Low Energy (`CoreBluetooth`)** | Conecta e troca dados com periféricos externos (smartwatches, sensores, fones, balanças). | O simulador não tem acesso ao controlador Bluetooth do Mac para emular periféricos BLE. | [Apple Developer - Core Bluetooth](https://apple.com) |
| **Leitura e Escrita NFC (`CoreNFC`)** | Lê etiquetas NFC (tags), cartões por aproximação e passes compatíveis. | Depende do chip físico de rádio frequência (NFC) presente apenas no iPhone. | [Apple Developer - Building an NFC Tag-Reader App](https://apple.com) |
| **Sensores de Movimento (`CoreMotion`)** | Lê dados do acelerômetro, giroscópio, magnetômetro (bússola real) e barômetro. | O Mac não possui os sensores inerciais de movimentação física de um smartphone. | [Apple Developer - Core Motion](https://apple.com) |
| **Realidade Aumentada (`ARKit` & `RealityKit`)** | Projeta objetos 3D no ambiente real usando câmera, giroscópio e scanner LiDAR (Pro). | Requer sincronia em tempo real entre câmera física, sensores de movimento e sensor LiDAR. | [Apple Developer - ARKit](https://apple.com) |
| **HealthKit (`HealthKit`)** | Lê e grava dados de saúde, batimentos cardíacos, passos e treinos sincronizados com o Apple Watch. | Embora tenha suporte parcial no simulador, sensores biométricos reais e pareamento com Watch exigem hardware. | [Apple Developer - HealthKit](https://apple.com) |
| **Apple Pay (`PassKit`)** | Processa pagamentos reais por aproximação ou dentro do app com cartões cadastrados na Carteira. | Exige o chip de segurança física (*Secure Element*) e autenticação biométrica real. | [Apple Developer - PassKit](https://apple.com) |
| **Ligações, SMS e Rede Celular (`CallKit` / `CoreTelephony`)** | Realiza chamadas telefônicas reais, envia SMS nativo e testa transições entre 5G e Wi-Fi. | O simulador utiliza apenas a conexão de rede do Mac e não possui modem celular. | [Apple Developer - VoIP Calling with CallKit](https://apple.com) |
