import SwiftUI

struct DataReviewView: View {
    @Binding var matchData: [Match]
    @State private var editingMatch: Match?
    @State private var showEditView = false

    var body: some View {
        ZStack {
            Color(red: 1 / 255, green: 10 / 255, blue: 65 / 255)
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

                        Button(action: {
                            editingMatch = match
                            showEditView = true
                        }) {
                            Image(systemName: "pencil")
                                .foregroundColor(.blue)
                        }
                        .padding(.trailing, 8)

                        Button(action: {
                            if let index = matchData.firstIndex(where: { $0.id == match.id }) {
                                matchData.remove(at: index)
                            }
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }
                .onDelete(perform: delete)
            }
            .sheet(isPresented: $showEditView) {
                if let editingMatch = editingMatch {
                    MatchEditView(match: $editingMatch, characters: characters) { updatedMatch in
                        if let index = matchData.firstIndex(where: { $0.id == updatedMatch.id }) {
                            matchData[index] = updatedMatch
                            showEditView = false
                        }
                    }
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
