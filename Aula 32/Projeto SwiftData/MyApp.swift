import SwiftUI
import SwiftData

@main struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ListaTarefasView()
        }
        .modelContainer(for: Tarefa.self) // Dispor os modelos
        //.modelContainer(for: Tarefa.self, inMemory: true) // Dispor modelos + Realizar testes via Canvas
    }
}
