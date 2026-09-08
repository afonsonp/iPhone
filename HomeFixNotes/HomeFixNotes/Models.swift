import Foundation
import SwiftData

enum ProblemCategory: String, Codable, CaseIterable, Identifiable {
    case buraco = "Buraco"
    case fechadura = "Fechadura"
    case fios = "Fios / Elétrico"
    case acabamento = "Acabamento"
    case pintura = "Pintura"
    case canalizacao = "Canalização"
    case carpintaria = "Carpintaria"
    case outro = "Outro"

    var id: String { rawValue }

    var symbol: String {
        switch self {
        case .buraco: return "circle.dashed"
        case .fechadura: return "key.fill"
        case .fios: return "bolt.fill"
        case .acabamento: return "paintbrush.pointed.fill"
        case .pintura: return "paintpalette.fill"
        case .canalizacao: return "drop.fill"
        case .carpintaria: return "hammer.fill"
        case .outro: return "wrench.and.screwdriver.fill"
        }
    }
}

enum RepairStatus: String, Codable, CaseIterable, Identifiable {
    case pendente = "Pendente"
    case emCurso = "Em curso"
    case concluido = "Concluído"

    var id: String { rawValue }

    var symbol: String {
        switch self {
        case .pendente: return "circle"
        case .emCurso: return "circle.lefthalf.filled"
        case .concluido: return "checkmark.circle.fill"
        }
    }
}

@Model
final class Area {
    var letter: String = ""
    var name: String = ""
    var order: Int = 0
    var createdAt: Date = Date()

    @Relationship(deleteRule: .cascade, inverse: \RepairItem.area)
    var items: [RepairItem] = []

    init(letter: String, name: String, order: Int) {
        self.letter = letter
        self.name = name
        self.order = order
        self.createdAt = Date()
    }

    var sortedItems: [RepairItem] {
        items.sorted { $0.number < $1.number }
    }
}

@Model
final class RepairItem {
    var code: String = ""
    var number: Int = 0
    var categoryRaw: String = ProblemCategory.outro.rawValue
    var itemDescription: String = ""
    var notes: String = ""
    var statusRaw: String = RepairStatus.pendente.rawValue
    var photoData: Data?
    var createdAt: Date = Date()

    var area: Area?

    @Relationship(deleteRule: .cascade, inverse: \ShoppingItem.repairItem)
    var shoppingItems: [ShoppingItem] = []

    var category: ProblemCategory {
        get { ProblemCategory(rawValue: categoryRaw) ?? .outro }
        set { categoryRaw = newValue.rawValue }
    }

    var status: RepairStatus {
        get { RepairStatus(rawValue: statusRaw) ?? .pendente }
        set { statusRaw = newValue.rawValue }
    }

    init(code: String, number: Int, category: ProblemCategory, itemDescription: String, notes: String = "", status: RepairStatus = .pendente, photoData: Data? = nil) {
        self.code = code
        self.number = number
        self.categoryRaw = category.rawValue
        self.itemDescription = itemDescription
        self.notes = notes
        self.statusRaw = status.rawValue
        self.photoData = photoData
        self.createdAt = Date()
    }
}

@Model
final class ShoppingItem {
    var name: String = ""
    var quantity: String = ""
    var isChecked: Bool = false
    var addedManually: Bool = false
    var createdAt: Date = Date()

    var repairItem: RepairItem?

    init(name: String, quantity: String = "", isChecked: Bool = false, addedManually: Bool = false, repairItem: RepairItem? = nil) {
        self.name = name
        self.quantity = quantity
        self.isChecked = isChecked
        self.addedManually = addedManually
        self.repairItem = repairItem
        self.createdAt = Date()
    }

    var originLabel: String? {
        guard let item = repairItem, let area = item.area else { return nil }
        return "\(item.code) · \(area.name)"
    }
}
