import SwiftUI

struct DataReviewView: View {
    @Binding var matchData: [Match]

    var body: some View {
                ZStack {
                    // Fond dégradé
                    LinearGradient(gradient: Gradient(colors: [
                        Color(red: 77 / 255, green: 128 / 255, blue: 118 / 255),
                        Color(red: 94 / 255, green: 151 / 255, blue: 136 / 255),
                        Color(red: 112 / 255, green: 175 / 255, blue: 153 / 255),
                        Color(red: 132 / 255, green: 199 / 255, blue: 170 / 255),
                        Color(red: 154 / 255, green: 223 / 255, blue: 186 / 255)
                    ]), startPoint: .bottom, endPoint: .top)
                    .edgesIgnoringSafeArea(.all)
        
        List {
            ForEach(matchData) { match in
                HStack {
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
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    Button(action: {
                        // Suppression du match
                        if let index = matchData.firstIndex(where: { $0.id == match.id }) {
                            matchData.remove(at: index)
                        }
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                }
            }
        }
                
            
        }
    }
}

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
        return "https://www.smashbros.com/assets_v2/img/fighter/\(formattedName)/ss_4.jpg"
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
