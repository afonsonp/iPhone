import SwiftUI
import SwiftData

@main
struct HomeFixNotesApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Area.self,
            RepairItem.self,
            ShoppingItem.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Não foi possível criar o ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            RootTabView()
        }
        .modelContainer(sharedModelContainer)
    }
}
