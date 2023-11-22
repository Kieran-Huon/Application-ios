import Foundation
import SwiftUI

class Match: ObservableObject, Identifiable, Equatable {
    let id = UUID()
    @Published var playerName1: String
    @Published var playerName2: String
    @Published var characterName1: String
    @Published var characterName2: String
    @Published var isBo3: Bool

    init(playerName1: String = "", playerName2: String = "", characterName1: String = "", characterName2: String = "", isBo3: Bool = true) {
        self.playerName1 = playerName1
        self.playerName2 = playerName2
        self.characterName1 = characterName1
        self.characterName2 = characterName2
        self.isBo3 = isBo3
    }

    static func == (lhs: Match, rhs: Match) -> Bool {
        lhs.id == rhs.id
    }
}

