import SwiftUI
import SwiftData

struct ShoppingListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \ShoppingItem.createdAt) private var shoppingItems: [ShoppingItem]

    @State private var showingAddManual = false
    @State private var newItemName = ""
    @State private var newItemQuantity = ""

    private var pending: [ShoppingItem] { shoppingItems.filter { !$0.isChecked } }
    private var checked: [ShoppingItem] { shoppingItems.filter { $0.isChecked } }

    var body: some View {
        NavigationStack {
            List {
                Section("Por comprar (\(pending.count))") {
                    ForEach(pending) { item in
                        ShoppingRow(item: item)
                    }
                    .onDelete { deleteItems(from: pending, at: $0) }

                    if pending.isEmpty {
                        Text("Sem itens por comprar.")
                            .foregroundStyle(.secondary)
                            .font(.footnote)
                    }
                }

                if !checked.isEmpty {
                    Section("Já comprado (\(checked.count))") {
                        ForEach(checked) { item in
                            ShoppingRow(item: item)
                        }
                        .onDelete { deleteItems(from: checked, at: $0) }
                    }
                }
            }
            .navigationTitle("Lista de compras")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showingAddManual = true
                    } label: {
                        Label("Adicionar", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddManual) {
                addManualSheet
            }
        }
    }

    private var addManualSheet: some View {
        NavigationStack {
            Form {
                TextField("Material (ex.: Fita isoladora)", text: $newItemName)
                TextField("Quantidade (ex.: 2 un.)", text: $newItemQuantity)
            }
            .navigationTitle("Novo item")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        newItemName = ""
                        newItemQuantity = ""
                        showingAddManual = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Adicionar") {
                        let item = ShoppingItem(
                            name: newItemName.trimmingCharacters(in: .whitespaces),
                            quantity: newItemQuantity.trimmingCharacters(in: .whitespaces),
                            addedManually: true
                        )
                        modelContext.insert(item)
                        newItemName = ""
                        newItemQuantity = ""
                        showingAddManual = false
                    }
                    .disabled(newItemName.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }

    private func deleteItems(from list: [ShoppingItem], at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(list[index])
        }
    }
}

private struct ShoppingRow: View {
    @Bindable var item: ShoppingItem

    var body: some View {
        Button {
            item.isChecked.toggle()
        } label: {
            HStack {
                Image(systemName: item.isChecked ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(item.isChecked ? .green : .secondary)
                VStack(alignment: .leading, spacing: 2) {
                    Text(item.name)
                        .strikethrough(item.isChecked)
                        .foregroundStyle(item.isChecked ? .secondary : .primary)
                    if let origin = item.originLabel {
                        Text(origin)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
                Spacer()
                if !item.quantity.isEmpty {
                    Text(item.quantity)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ShoppingListView()
        .modelContainer(for: [Area.self, RepairItem.self, ShoppingItem.self], inMemory: true)
}
