import SwiftUI
import SwiftData

struct ItemFormView: View {
    let area: Area
    let editingItem: RepairItem?

    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var category: ProblemCategory = .outro
    @State private var itemDescription: String = ""
    @State private var notes: String = ""
    @State private var status: RepairStatus = .pendente
    @State private var uiImage: UIImage?

    @State private var materials: [MaterialDraft] = []
    @State private var showingPhotoSourceDialog = false
    @State private var showingCamera = false
    @State private var showingLibrary = false

    struct MaterialDraft: Identifiable {
        let id = UUID()
        var name: String = ""
        var quantity: String = ""
    }

    private var previewCode: String {
        if let editingItem { return editingItem.code }
        return CodeGenerator.itemCode(letter: area.letter, number: CodeGenerator.nextItemNumber(in: area))
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Identificação") {
                    HStack {
                        Text("Código")
                        Spacer()
                        Text(previewCode)
                            .font(.headline)
                            .foregroundStyle(Color.accentColor)
                    }
                    Picker("Tipo de problema", selection: $category) {
                        ForEach(ProblemCategory.allCases) { category in
                            Label(category.rawValue, systemImage: category.symbol).tag(category)
                        }
                    }
                    Picker("Estado", selection: $status) {
                        ForEach(RepairStatus.allCases) { status in
                            Text(status.rawValue).tag(status)
                        }
                    }
                }

                Section("Foto") {
                    if let uiImage {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 220)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    Button {
                        showingPhotoSourceDialog = true
                    } label: {
                        Label(uiImage == nil ? "Tirar / escolher foto" : "Substituir foto", systemImage: "camera")
                    }
                }

                Section("Descrição") {
                    TextField("Ex.: Buraco na parede junto à janela", text: $itemDescription, axis: .vertical)
                    TextField("Notas adicionais", text: $notes, axis: .vertical)
                        .lineLimit(3...6)
                }

                Section("Materiais / lista de compras") {
                    ForEach($materials) { $material in
                        HStack {
                            TextField("Material (ex.: Massa de vidraceiro)", text: $material.name)
                            TextField("Qtd.", text: $material.quantity)
                                .frame(width: 70)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    .onDelete { materials.remove(atOffsets: $0) }

                    Button {
                        materials.append(MaterialDraft())
                    } label: {
                        Label("Adicionar material", systemImage: "plus.circle")
                    }
                }
            }
            .navigationTitle(editingItem == nil ? "Novo item" : "Editar \(previewCode)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Guardar") { save() }
                        .disabled(itemDescription.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
            .confirmationDialog("Adicionar foto", isPresented: $showingPhotoSourceDialog) {
                Button("Câmara") { showingCamera = true }
                Button("Biblioteca de fotos") { showingLibrary = true }
                Button("Cancelar", role: .cancel) {}
            }
            .fullScreenCover(isPresented: $showingCamera) {
                ImagePicker(source: .camera, image: $uiImage)
                    .ignoresSafeArea()
            }
            .sheet(isPresented: $showingLibrary) {
                ImagePicker(source: .photoLibrary, image: $uiImage)
            }
            .onAppear(perform: loadEditingItem)
        }
    }

    private func loadEditingItem() {
        guard let item = editingItem else { return }
        category = item.category
        itemDescription = item.itemDescription
        notes = item.notes
        status = item.status
        if let data = item.photoData {
            uiImage = UIImage(data: data)
        }
        materials = item.shoppingItems.map { MaterialDraft(name: $0.name, quantity: $0.quantity) }
    }

    private func save() {
        let photoData = uiImage?.jpegData(compressionQuality: 0.7)
        let cleanMaterials = materials
            .map { MaterialDraft(name: $0.name.trimmingCharacters(in: .whitespaces), quantity: $0.quantity.trimmingCharacters(in: .whitespaces)) }
            .filter { !$0.name.isEmpty }

        if let item = editingItem {
            item.category = category
            item.itemDescription = itemDescription.trimmingCharacters(in: .whitespaces)
            item.notes = notes.trimmingCharacters(in: .whitespaces)
            item.status = status
            if let photoData { item.photoData = photoData }

            for existing in item.shoppingItems {
                modelContext.delete(existing)
            }
            for draft in cleanMaterials {
                let shoppingItem = ShoppingItem(name: draft.name, quantity: draft.quantity, repairItem: item)
                modelContext.insert(shoppingItem)
            }
        } else {
            let number = CodeGenerator.nextItemNumber(in: area)
            let code = CodeGenerator.itemCode(letter: area.letter, number: number)
            let newItem = RepairItem(
                code: code,
                number: number,
                category: category,
                itemDescription: itemDescription.trimmingCharacters(in: .whitespaces),
                notes: notes.trimmingCharacters(in: .whitespaces),
                status: status,
                photoData: photoData
            )
            newItem.area = area
            modelContext.insert(newItem)

            for draft in cleanMaterials {
                let shoppingItem = ShoppingItem(name: draft.name, quantity: draft.quantity, repairItem: newItem)
                modelContext.insert(shoppingItem)
            }
        }

        dismiss()
    }
}

#Preview {
    let area = Area(letter: "A", name: "Cozinha", order: 0)
    return ItemFormView(area: area, editingItem: nil)
        .modelContainer(for: [Area.self, RepairItem.self, ShoppingItem.self], inMemory: true)
}
