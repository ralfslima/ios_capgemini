import SwiftUI

@main struct MyApp: App {
    
    @State private var viewModel = EnderecoViewModel()
    
    var body: some Scene {
        WindowGroup {
            CadastroView(viewModel: viewModel)
        }
    }
}
