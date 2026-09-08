import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            AreasListView()
                .tabItem {
                    Label("Obras", systemImage: "house.fill")
                }

            ShoppingListView()
                .tabItem {
                    Label("Compras", systemImage: "cart.fill")
                }
        }
    }
}

#Preview {
    RootTabView()
}
