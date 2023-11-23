
struct PexelsResponse: Decodable {
    let photos: [PexelsPhoto]
}

struct PexelsPhoto: Decodable, Hashable {
    let id: Int
    let src: PexelsSource
    // Vous pouvez ajouter d'autres champs si nécessaire, comme photographer, url, etc.
}

struct PexelsSource: Decodable, Hashable {
    let original: String
    let small: String
    // Ajoutez d'autres tailles si vous en avez besoin
}

import SwiftUI

struct PexelsImageView: View {
    @State private var searchText: String = ""
    @State private var photos: [PexelsPhoto] = []
    @State private var isLoading: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                TextField("Rechercher des images", text: $searchText, onCommit: {
                    fetchImages()
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

                if !photos.isEmpty {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                            ForEach(photos, id: \.id) { photo in
                                if let url = URL(string: photo.src.small) {
                                    AsyncImage(url: url) { image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 100, height: 100)
                                }
                            }
                        }
                    }
                } else {
                    Spacer()
                    Text("Aucune image à afficher")
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
            .navigationBarTitle("Pexels Images")
        }
    }




    func fetchImages() {
        guard !searchText.isEmpty else { return }
        let url = URL(string: "https://api.pexels.com/v1/search?query=\(searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&per_page=15")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("563492ad6f91700001000001c83f19eae8104f0d8243b62cec5639a0", forHTTPHeaderField: "Authorization") // Remplacez par votre clé API

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                isLoading = false
                guard let data = data, error == nil else {
                    print("Erreur de requête: \(error?.localizedDescription ?? "Erreur inconnue")")
                    return
                }

                do {
                    let response = try JSONDecoder().decode(PexelsResponse.self, from: data)
                    self.photos = response.photos
                } catch {
                    print("Erreur de parsing: \(error)")
                }
            }
        }

        isLoading = true
        task.resume()
    }

    struct PexelsResponse: Decodable {
        let photos: [PexelsPhoto]
    }
    }
