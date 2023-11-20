import SwiftUI

struct MatchSummaryView: View {
    let playerName1: String
    let playerName2: String
    let characterName1: String
    let characterName2: String
    let matchFormat: String
    
    @State private var characterImage1: UIImage?
    @State private var characterImage2: UIImage?

    var body: some View {
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
                                        .frame(width: 120, height: 120)
                                        
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
                                        .frame(width: 120, height: 120)
                                        
                                }
                                Text(characterName2)
                            }
                            .padding()
                        }
                        Spacer() 
                    }
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
