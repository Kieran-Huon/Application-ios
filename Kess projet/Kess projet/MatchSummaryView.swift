import SwiftUI

struct MatchSummaryView: View {
    let playerName1: String
    let playerName2: String
    let characterName1: String
    let characterName2: String
    let matchFormat: String
    var onSave: (Match) -> Void
    
    @State private var characterImage1: UIImage?
    @State private var characterImage2: UIImage?
    

    var body: some View {
//        ZStack {
//                    // Fond dégradé
//                    LinearGradient(gradient: Gradient(colors: [
//                        Color(red: 77 / 255, green: 128 / 255, blue: 118 / 255),
//                        Color(red: 94 / 255, green: 151 / 255, blue: 136 / 255),
//                        Color(red: 112 / 255, green: 175 / 255, blue: 153 / 255),
//                        Color(red: 132 / 255, green: 199 / 255, blue: 170 / 255),
//                        Color(red: 154 / 255, green: 223 / 255, blue: 186 / 255)
//                    ]), startPoint: .bottom, endPoint: .top)
//                    .edgesIgnoringSafeArea(.all)

                    // Contenu de votre vue
        VStack {
            Text("")
                .padding(.bottom, 20)
            HStack {
                            VStack {
                                Text(playerName1)
                                    .font(.headline)
                                if let image = characterImage1 {
                                    Image(uiImage: image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 110, height: 120)
                                        
                                }
                                Text(characterName1)
                            }
                            .padding()

                            Text(matchFormat)
                                .font(.headline)
                                .padding()

                            VStack {
                                Text(playerName2)
                                    .font(.headline)
                                if let image = characterImage2 {
                                    Image(uiImage: image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 110, height: 110)
                                        
                                }
                                Text(characterName2)
                            }
                            .padding()
                        }
                        Spacer() 
                    }
        
        Button("Valider") {
                        let newMatch = Match(playerName1: playerName1, playerName2: playerName2, characterName1: characterName1, characterName2: characterName2, matchFormat: matchFormat)
                        onSave(newMatch)
                    }
//        }
                    .padding()
                    .padding()
                    .onAppear {
                        
                        loadImage(from: formattedCharacterName(characterName1)) { image in
                            characterImage1 = image
                        }
                        
                        loadImage(from: formattedCharacterName(characterName2)) { image in
                            characterImage2 = image
                        }
                    }
                    .navigationTitle("Résumé du Match")
                }
                
                // Formate le nom du personnage pour correspondre à l'URL de l'image
                func formattedCharacterName(_ characterName: String) -> String {
                    let formattedName = characterName.lowercased().replacingOccurrences(of: " ", with: "_")
                    return "https://www.smashbros.com/assets_v2/img/fighter/\(formattedName)/ss_4.jpg"
                }
                
                // Charge l'image à partir de l'URL
                func loadImage(from url: String, completion: @escaping (UIImage?) -> Void) {
                    if let url = URL(string: url) {
                        URLSession.shared.dataTask(with: url) { data, response, error in
                            if let data = data, let image = UIImage(data: data) {
                                completion(image)
                            } else {
                                completion(nil)
                            }
                        }.resume()
                    } else {
                        completion(nil)
                    }
                }
    
    
            }
