//
//  ContentView.swift
//  Kess projet
//
//  Created by HUON Kieran on 20/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var nameJ1 = ""
    @State private var nameJ2 = ""
    @State private var isBo3 = true
    @State private var isWinnerChosen = false
    let characters = [
        "Mario", "Donkey Kong", "Link", "Samus", "Dark Samus", "Yoshi", "Kirby",
        "Fox", "Pikachu", "Luigi", "Ness", "Captain Falcon", "Jigglypuff", "Peach",
        "Daisy", "Bowser", "Ice Climbers", "Sheik", "Zelda", "Dr. Mario", "Pichu",
        "Falco", "Marth", "Lucina", "Young Link", "Ganondorf", "Mewtwo", "Roy",
        "Chrom", "Mr. Game & Watch", "Meta Knight", "Pit", "Dark Pit", "Zero Suit Samus",
        "Wario", "Snake", "Ike", "Pokemon Trainer", "Diddy Kong", "Lucas", "Sonic",
        "King Dedede", "Olimar", "Lucario", "R.O.B.", "Toon Link", "Wolf", "Villager",
        "Mega Man", "Wii Fit Trainer", "Rosalina & Luma", "Little Mac", "Greninja",
        "Mii Brawler", "Mii Swordfighter", "Mii Gunner", "Palutena", "Pac-Man",
        "Robin", "Shulk", "Bowser Jr.", "Duck Hunt", "Ryu", "Ken", "Cloud",
        "Corrin", "Bayonetta", "Inkling", "Ridley", "Simon", "Richter", "King K. Rool",
        "Isabelle", "Incineroar", "Piranha Plant", "Joker", "Hero", "Banjo & Kazooie",
        "Terry", "Byleth", "Min Min", "Steve", "Sephiroth", "Pyra", "Mythra",
        "Kazuya", "Sora", "Steve"
    ]
    @State private var selectedCharacter1 = ""
    @State private var selectedCharacter2 = ""
    @State private var isSummaryVisible = false
    @State private var matchSummary = ""
    
    
    
    var body: some View {
        VStack {
            if !isWinnerChosen {
                TextField("Nom joueur 1",text: $nameJ1)
                    .padding()
                Picker("Personnage Joueur 1", selection: $selectedCharacter1) {
                                        ForEach(characters, id: \.self) {
                                            Text($0)
                                        }
                                    }
                    .padding()
                TextField("Nom joueur 2",text: $nameJ2)
                    .padding()
                Picker("Personnage Joueur 2", selection: $selectedCharacter2) {
                                        ForEach(characters, id: \.self) {
                                            Text($0)
                                        }
                                    }
                
                                        
                    .padding()
                
                Toggle(isOn: $isBo3) {
                    Text(isBo3 ? "Bo3" : "Bo5")
                }
                .padding()
                
                if !isSummaryVisible {
                            Button(action: {
                                // Bouton Resume
                                let matchFormat = isBo3 ? "Bo3" : "Bo5"
                                matchSummary = "\(nameJ1) jouera \(selectedCharacter1) contre \(nameJ2) qui jouera \(selectedCharacter2) en \(matchFormat)."

                                
                                isSummaryVisible = true
                            }) {
                                Text("Résumé du Match")
                            }
                            .padding()
                        }

                        // Navigation
                        if isSummaryVisible {
                            NavigationLink("", destination: MatchSummaryView(playerName1: nameJ1, playerName2: nameJ2, characterName1: selectedCharacter1, characterName2: selectedCharacter2, matchFormat: isBo3 ? "Bo3" : "Bo5"), isActive: $isSummaryVisible)
                                .opacity(0)
                                .frame(width: 0, height: 0)
                        }
                    }
            
                
        }
        .navigationTitle("Création du set")
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    }
