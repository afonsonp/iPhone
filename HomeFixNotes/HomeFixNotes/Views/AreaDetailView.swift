import SwiftUI
import SwiftData

struct AreaDetailView: View {
    @Bindable var area: Area
    @Environment(\.modelContext) private var modelContext
    @State private var showingAddItem = false

    var body: some View {
        List {
            ForEach(area.sortedItems) { item in
                NavigationLink(value: item) {
                    ItemRow(item: item)
                }
            }
            .onDelete(perform: deleteItems)

            if area.items.isEmpty {
                Text("Sem itens nesta área. Toca em + para tirar uma foto e registar um problema.")
                    .foregroundStyle(.secondary)
                    .font(.footnote)
            }
        }
        .navigationTitle("Área \(area.letter) · \(area.name)")
        .navigationDestination(for: RepairItem.self) { item in
            ItemDetailView(item: item)
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    showingAddItem = true
                } label: {
                    Label("Novo item", systemImage: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddItem) {
            ItemFormView(area: area, editingItem: nil)
        }
    }

    private func deleteItems(at offsets: IndexSet) {
        let items = area.sortedItems
        for index in offsets {
            modelContext.delete(items[index])
        }
    }
}

private struct ItemRow: View {
    let item: RepairItem

    var body: some View {
        HStack(spacing: 12) {
            if let data = item.photoData, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } else {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.accentColor.opacity(0.12))
                    .frame(width: 48, height: 48)
                    .overlay(Image(systemName: item.category.symbol).foregroundStyle(Color.accentColor))
            }

            VStack(alignment: .leading, spacing: 3) {
                HStack(spacing: 6) {
                    Text(item.code).font(.headline)
                    Text(item.category.rawValue)
                        .font(.caption.weight(.medium))
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color.accentColor.opacity(0.12))
                        .clipShape(Capsule())
                }
                if !item.itemDescription.isEmpty {
                    Text(item.itemDescription)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }
            }

            Spacer()

            Image(systemName: item.status.symbol)
                .foregroundStyle(item.status == .concluido ? .green : .secondary)
        }
        .padding(.vertical, 2)
    }
}

#Preview {
    let area = Area(letter: "A", name: "Cozinha", order: 0)
    return NavigationStack {
        AreaDetailView(area: area)
    }
    .modelContainer(for: [Area.self, RepairItem.self, ShoppingItem.self], inMemory: true)
}
