import SwiftUI
import SwiftData

struct AreasListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Area.order) private var areas: [Area]
    @Query private var allItems: [RepairItem]

    @State private var showingAddArea = false

    var body: some View {
        NavigationStack {
            List {
                if !categorySummary.isEmpty {
                    Section("Resumo") {
                        CategorySummaryView(summary: categorySummary)
                    }
                }

                Section("Áreas") {
                    ForEach(areas) { area in
                        NavigationLink(value: area) {
                            AreaRow(area: area)
                        }
                    }
                    .onDelete(perform: deleteAreas)

                    if areas.isEmpty {
                        Text("Ainda não criaste nenhuma área. Toca em + para começar (ex.: Cozinha, Sala, Quarto).")
                            .foregroundStyle(.secondary)
                            .font(.footnote)
                    }
                }
            }
            .navigationTitle("Obras de casa")
            .navigationDestination(for: Area.self) { area in
                AreaDetailView(area: area)
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showingAddArea = true
                    } label: {
                        Label("Nova área", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddArea) {
                AddAreaSheet()
            }
        }
    }

    private var categorySummary: [(ProblemCategory, Int)] {
        var counts: [ProblemCategory: Int] = [:]
        for item in allItems where item.status != .concluido {
            counts[item.category, default: 0] += 1
        }
        return ProblemCategory.allCases.compactMap { category in
            guard let count = counts[category], count > 0 else { return nil }
            return (category, count)
        }
    }

    private func deleteAreas(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(areas[index])
        }
    }
}

private struct AreaRow: View {
    let area: Area

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(Color.accentColor.opacity(0.15))
                    .frame(width: 40, height: 40)
                Text(area.letter)
                    .font(.headline)
                    .foregroundStyle(Color.accentColor)
            }
            VStack(alignment: .leading, spacing: 2) {
                Text(area.name)
                    .font(.body)
                let pendentes = area.items.filter { $0.status != .concluido }.count
                Text(pendentes == 0 ? "Sem itens pendentes" : "\(pendentes) por resolver · \(area.items.count) no total")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 2)
    }
}

private struct CategorySummaryView: View {
    let summary: [(ProblemCategory, Int)]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(summary, id: \.0) { category, count in
                    HStack(spacing: 6) {
                        Image(systemName: category.symbol)
                        Text("\(count) \(category.rawValue.lowercased())")
                            .font(.footnote.weight(.medium))
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(Color.accentColor.opacity(0.12))
                    .clipShape(Capsule())
                }
            }
        }
        .listRowInsets(EdgeInsets())
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

#Preview {
    AreasListView()
        .modelContainer(for: [Area.self, RepairItem.self, ShoppingItem.self], inMemory: true)
}
