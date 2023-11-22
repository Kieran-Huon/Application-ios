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
        ZStack {
            Color(red: 2 / 255, green: 7 / 255, blue: 51 / 255)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                    .frame(height: 100)

                HStack {
                    VStack {
                        Text(playerName1)
                            .font(.headline)
                            .foregroundColor(.white)
                        if let image = characterImage1 {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 110, height: 120)
                        }
                        Text(characterName1)
                            .foregroundColor(.white)
                    }
                    .padding()

                    Text(matchFormat)
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)

                    VStack {
                        Text(playerName2)
                            .font(.headline)
                            .foregroundColor(.white)
                        if let image = characterImage2 {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 110, height: 110)
                        }
                        Text(characterName2)
                            .foregroundColor(.white)
                    }
                    .padding()
                }

                Spacer()

                Button(action: {
                                    let newMatch = Match(playerName1: playerName1, playerName2: playerName2, characterName1: characterName1, characterName2: characterName2, isBo3: matchFormat == "Bo3")
                                    onSave(newMatch)
                                }) {
                                    Text("Valider")
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: 100)
                                        .background(Color.blue)
                                        .cornerRadius(10)
                                }
                                .padding()
            }
        }
        .onAppear {
            loadImage(from: formattedCharacterName(characterName1)) { image in
                characterImage1 = image
            }
            loadImage(from: formattedCharacterName(characterName2)) { image in
                characterImage2 = image
            }
        }
        .navigationTitle("Résumé du Match")
        .foregroundColor(.white)
    }

    func formattedCharacterName(_ characterName: String) -> String {
        let formattedName = characterName.lowercased().replacingOccurrences(of: " ", with: "_")
        return "https://www.smashbros.com/assets_v2/img/fighter/pict/\(formattedName).png"
    }

    func loadImage(from url: String, completion: @escaping (UIImage?) -> Void) {
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
