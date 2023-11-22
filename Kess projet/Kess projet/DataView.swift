import SwiftUI

struct DataReviewView: View {
    @Binding var matchData: [Match]
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
    @State private var editingMatch: Match?
    @State private var showEditView = false
    @State private var refreshId = UUID()
        
        var body: some View {
            ZStack {
                Color(red: 2 / 255, green: 7 / 255, blue: 51 / 255)
                                   .edgesIgnoringSafeArea(.all)
                    
                List {
                    
                    ForEach(matchData) { match in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(match.playerName1)
                                    .font(.headline)
                                Text(match.characterName1)
                                CharacterImage(characterName: match.characterName1)
                            }
                            
                            Text("vs")
                            
                            VStack(alignment: .leading) {
                                Text(match.playerName2)
                                    .font(.headline)
                                Text(match.characterName2)
                                CharacterImage(characterName: match.characterName2)
                            }
                            
                            Spacer()
                                                }
                                                .swipeActions(edge: .leading) {
                                                    Button {
                                                        editingMatch = match
                                                        showEditView = true
                                                    } label: {
                                                        Label("Modifier", systemImage: "pencil")
                                                    }
                                                    .tint(.blue)
                                                }
                                                .swipeActions(edge: .trailing) {
                                                    Button(role: .destructive) {
                                                        if let index = matchData.firstIndex(where: { $0.id == match.id }) {
                                                            matchData.remove(at: index)
                                                        }
                                                    } label: {
                                                        Label("Supprimer", systemImage: "trash")
                                                    }
                                                }
                                            }
                                        }
                
                        
                .sheet(isPresented: $showEditView) {
                    // Création d'un Binding<Match> à partir de editingMatch
                    let matchBinding = Binding<Match>(
                        get: { self.editingMatch ?? Match() }, // Fournir une valeur par défaut
                        set: { self.editingMatch = $0 }
                    )

                    MatchEditView(match: matchBinding, characters: characters) {
                        // Logique de sauvegarde
                        if let editingMatch = editingMatch, let index = matchData.firstIndex(where: { $0.id == editingMatch.id }) {
                            matchData[index] = editingMatch
                            showEditView = false
                        }
                    }
                }
                .onChange(of: editingMatch) { _ in
                    refreshId = UUID()
                }
                .id(refreshId)
                

                                        }
                                    }
                                
    
        func delete(at offsets: IndexSet) {
            matchData.remove(atOffsets: offsets)
        }
    }
        // Votre structure CharacterImage reste inchangée
        
        
        struct CharacterImage: View {
            let characterName: String
            @State private var characterImage: UIImage?
            
            var body: some View {
                Group {
                    if let image = characterImage {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                    } else {
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 60, height: 60)
                    }
                }
                .onAppear {
                    loadImage(from: formattedCharacterName(characterName)) { image in
                        characterImage = image
                    }
                }
            }
            func formattedCharacterName(_ characterName: String) -> String {
                // Votre logique pour formater le nom du personnage en URL
                let formattedName = characterName.lowercased().replacingOccurrences(of: " ", with: "_")
                return "https://www.smashbros.com/assets_v2/img/fighter/pict/\(formattedName).png"
            }
            
            func loadImage(from url: String, completion: @escaping (UIImage?) -> Void) {
                // Votre logique pour charger l'image à partir de l'URL
                if let url = URL(string: url) {
                    URLSession.shared.dataTask(with: url) { data, response, error in
                        if let data = data, let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                completion(image)
                            }
                        } else {
                            completion(nil)
                        }
                    }.resume()
                } else {
                    completion(nil)
                }
            }
        }
    
