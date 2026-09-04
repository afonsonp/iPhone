import SwiftUI
import SwiftData

struct AddAreaSheet: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Query(sort: \Area.order) private var areas: [Area]

    @State private var name: String = ""

    private var nextLetter: String {
        CodeGenerator.nextAreaLetter(existingAreas: areas)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Nome da divisão (ex.: Cozinha, Sala)", text: $name)
                } footer: {
                    Text("Esta área vai ficar identificada como Área \(nextLetter). Os itens dentro dela ficam \(nextLetter)1, \(nextLetter)2, ...")
                }
            }
            .navigationTitle("Nova área")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Guardar") { save() }
                        .disabled(name.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }

    private func save() {
        let area = Area(letter: nextLetter, name: name.trimmingCharacters(in: .whitespaces), order: areas.count)
        modelContext.insert(area)
        dismiss()
    }
}

#Preview {
    AddAreaSheet()
        .modelContainer(for: [Area.self, RepairItem.self, ShoppingItem.self], inMemory: true)
}
