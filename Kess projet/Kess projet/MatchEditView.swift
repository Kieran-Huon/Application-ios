////
////  MatchEditView.swift
////  Kess projet
////
////  Created by HUON Kieran on 21/11/2023.
////
//
import SwiftUI



struct MatchEditView: View {
    @Binding var match: Match
    let characters: [String]
    var onSave: (Match) -> Void

    var body: some View {
        NavigationView {
            Form {
                TextField("Nom joueur 1", text: $match.playerName1)

                Picker("Personnage Joueur 1", selection: $match.characterName1) {
                    ForEach(characters, id: \.self) { character in
                        Text(character).tag(character)
                    }
                }.pickerStyle(WheelPickerStyle())

                TextField("Nom joueur 2", text: $match.playerName2)

                Picker("Personnage Joueur 2", selection: $match.characterName2) {
                    ForEach(characters, id: \.self) { character in
                        Text(character).tag(character)
                    }
                }.pickerStyle(WheelPickerStyle())

                Toggle("Bo3 / Bo5", isOn: $match.isBo3)

                Button("Sauvegarder les changements") {
                    onSave(match)
                }
            }
            .navigationBarTitle("Modifier le Match", displayMode: .inline)
        }
    }
}


