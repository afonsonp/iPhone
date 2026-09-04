import SwiftUI
import SwiftData

struct ItemDetailView: View {
    @Bindable var item: RepairItem
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var showingEdit = false

    var body: some View {
        List {
            if let data = item.photoData, let uiImage = UIImage(data: data) {
                Section {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .listRowInsets(EdgeInsets())
                        .padding(.vertical, 4)
                }
            }

            Section {
                LabeledContent("Código", value: item.code)
                LabeledContent("Tipo") {
                    Label(item.category.rawValue, systemImage: item.category.symbol)
                }
                Picker("Estado", selection: $item.status) {
                    ForEach(RepairStatus.allCases) { status in
                        Text(status.rawValue).tag(status)
                    }
                }
            }

            if !item.itemDescription.isEmpty || !item.notes.isEmpty {
                Section("Descrição") {
                    if !item.itemDescription.isEmpty {
                        Text(item.itemDescription)
                    }
                    if !item.notes.isEmpty {
                        Text(item.notes)
                            .foregroundStyle(.secondary)
                    }
                }
            }

            if !item.shoppingItems.isEmpty {
                Section("Materiais necessários") {
                    ForEach(item.shoppingItems) { material in
                        HStack {
                            Text(material.name)
                            Spacer()
                            if !material.quantity.isEmpty {
                                Text(material.quantity).foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(item.code)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    showingEdit = true
                } label: {
                    Label("Editar", systemImage: "pencil")
                }
            }
        }
        .sheet(isPresented: $showingEdit) {
            if let area = item.area {
                ItemFormView(area: area, editingItem: item)
            }
        }
    }
}

#Preview {
    let area = Area(letter: "A", name: "Cozinha", order: 0)
    let item = RepairItem(code: "A1", number: 1, category: .buraco, itemDescription: "Buraco na parede junto à janela")
    item.area = area
    return NavigationStack {
        ItemDetailView(item: item)
    }
    .modelContainer(for: [Area.self, RepairItem.self, ShoppingItem.self], inMemory: true)
}
