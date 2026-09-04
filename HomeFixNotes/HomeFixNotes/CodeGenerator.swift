import Foundation

enum CodeGenerator {

    /// Gera a próxima letra de área disponível: A, B, C, ... Z, AA, AB, ...
    static func nextAreaLetter(existingAreas: [Area]) -> String {
        let usedLetters = Set(existingAreas.map { $0.letter })
        var index = 0
        while true {
            let candidate = letter(forIndex: index)
            if !usedLetters.contains(candidate) {
                return candidate
            }
            index += 1
        }
    }

    private static func letter(forIndex index: Int) -> String {
        var n = index
        var result = ""
        repeat {
            let remainder = n % 26
            let scalar = UnicodeScalar(65 + remainder)!
            result = String(Character(scalar)) + result
            n = n / 26 - 1
        } while n >= 0
        return result
    }

    /// Gera o próximo número de item dentro de uma área (ex.: A1, A2, A3...).
    static func nextItemNumber(in area: Area) -> Int {
        (area.items.map { $0.number }.max() ?? 0) + 1
    }

    static func itemCode(letter: String, number: Int) -> String {
        "\(letter)\(number)"
    }
}
