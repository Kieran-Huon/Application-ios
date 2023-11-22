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
    @Binding var matchData: [Match]
    @State private var textInput: String = ""
    
    
    
    
    
    var body: some View {
            NavigationView {
                ZStack {
                    // Fond vert pour toute la vue
//                    LinearGradient(gradient: Gradient(colors: [
//                                        Color(red: 77 / 255, green: 128 / 255, blue: 118 / 255),
//                                        Color(red: 94 / 255, green: 151 / 255, blue: 136 / 255),
//                                        Color(red: 112 / 255, green: 175 / 255, blue: 153 / 255),
//                                        Color(red: 132 / 255, green: 199 / 255, blue: 170 / 255),
//                                        Color(red: 154 / 255, green: 223 / 255, blue: 186 / 255)
//                    ]), startPoint: .top, endPoint: .bottom)
//                                    .edgesIgnoringSafeArea(.all)
                    Color(red: 2 / 255, green: 7 / 255, blue: 51 / 255)
                                       .edgesIgnoringSafeArea(.all)

                    // Case principale blanche englobant tous les éléments
                    ScrollView {
                        Image("logo_ios")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200) // Taille de l'image
                        .clipShape(Circle()) // Cela rendra l'image ronde
                        
                        .padding(.top)
                        VStack(spacing: 0) {
                            
                            if !isWinnerChosen {
                                TextField("",
                                                  text: $nameJ1,
                                                  prompt: Text("Nom joueur 1")
                                                        .foregroundColor(Color(red: 184 / 255, green: 184 / 255, blue: 184 / 255))
                                        )
//                                TextField("Nom joueur 1", text: $nameJ1)
                                    .accentColor(Color.white)
                                    .foregroundColor(Color.white)
                                    .padding()
                                Picker("Personnage Joueur 1", selection: $selectedCharacter1) {
                                    ForEach(characters, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .padding()
                                
                                TextField("",
                                                  text: $nameJ2,
                                                  prompt: Text("Nom joueur 2")
                                                        .foregroundColor(Color(red: 184 / 255, green: 184 / 255, blue: 184 / 255))
                                        )
//                                TextField("Nom joueur 2", text: $nameJ2)
                                    .accentColor(Color.white)
                                    .foregroundColor(Color.white)
                                    .padding()
                                    
                                Picker("Personnage Joueur 2", selection: $selectedCharacter2) {
                                    ForEach(characters, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .padding()

                                Toggle(isOn: $isBo3) {
                                    Text(isBo3 ? "Bo3" : "Bo5").foregroundColor(Color.white)
                                }
                                .padding()

                                if !isSummaryVisible {
                                    Button(action: {
                                        let matchFormat = isBo3 ? "Bo3" : "Bo5"
                                        matchSummary = "\(nameJ1) jouera \(selectedCharacter1) contre \(nameJ2) qui jouera \(selectedCharacter2) en \(matchFormat)."
                                        isSummaryVisible = true
                                    }) {
                                        Text("Résumé du Match")
                                    }
                                    .padding()
                                }
                            }

                            if isSummaryVisible {
                                NavigationLink(destination: MatchSummaryView(playerName1: nameJ1, playerName2: nameJ2, characterName1: selectedCharacter1, characterName2: selectedCharacter2, matchFormat: isBo3 ? "Bo3" : "Bo5") { match in
                                                        self.matchData.append(match) // Ajoute le match à matchData
                                                        self.isSummaryVisible = false // Ferme MatchSummaryView après l'enregistrement
                                                    }, isActive: $isSummaryVisible) {
                                                        EmptyView()
                                                    }
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color(red: 1 / 255, green: 20 / 255, blue: 60 / 255))
                        .cornerRadius(10)
                        .padding(.horizontal, 10) // Réduit la largeur
                        .padding(.vertical, 10) // Augmente la longueur
                        
                    }
                    .edgesIgnoringSafeArea(.bottom)
                }
                
            }
        }
    }



    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(matchData: .constant([]))
        }
    }
