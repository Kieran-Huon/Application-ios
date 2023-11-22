import SwiftUI



struct MatchEditView: View {
    @Binding var match: Match
    let characters: [String]
    var onSave: () -> Void

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Informations des Joueurs")) {
                    TextField("Nom joueur 1", text: $match.playerName1)
                    TextField("Nom joueur 2", text: $match.playerName2)
                }

                Section(header: Text("Sélection des Personnages")) {
                    Picker("Personnage Joueur 1", selection: $match.characterName1) {
                        ForEach(characters, id: \.self) { character in
                            Text(character).tag(character)
                        }
                    }

                    Picker("Personnage Joueur 2", selection: $match.characterName2) {
                        ForEach(characters, id: \.self) { character in
                            Text(character).tag(character)
                        }
                    }
                }

                Section(header: Text("Format du Match")) {
                    Toggle(isOn: $match.isBo3) {
                        Text("Bo3 / Bo5")
                    }
                }

                Section {
                    Button("Sauvegarder les changements", action: onSave)
                }
            }
            .navigationBarTitle("Modifier le Match", displayMode: .inline)
        }
    }
}


