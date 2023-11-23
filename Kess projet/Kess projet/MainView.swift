import SwiftUI

struct MainView: View {
    @State private var matchData: [Match] = []

    var body: some View {
        TabView {
            
            MapSelectionView(viewModel: MapSelectionViewModel(maps: [
                Map(name: "Champs de bataille", imageName: "SSBU-Battlefield"),
                Map(name: "Destination finale", imageName: "SSBU-Final_Destination"),
                Map(name: "Petit champs de bataille", imageName: "SSBU-Small-Battlefield"),
                Map(name: "Pokemon Stadium 2", imageName: "SSBU-Pokémon_Stadium_2"),
                Map(name: "Yoshi's Story", imageName: "SSBU-Yoshi's_Story"),
                Map(name: "Smash ville", imageName: "SSBU-Smashville"),
//                Map(name: "Laylat", imageName: "SSBU-Lylat"),
                Map(name: "Town & City", imageName: "SSBU-Town_and_City"),
                Map(name: "Kalos", imageName: "SSBU-Kalos"),
                Map(name: "Hollow Bastion", imageName: "SSBU-Hollow_Bastion")
//                Map(name: "Northern Cave", imageName: "SSBU_Northern_Cave")
                        ]))
                        .tabItem {
                            Label("Terrain", systemImage: "square.grid.3x3")
                        }.environment(\.colorScheme, .dark)
            
            ContentView(matchData: $matchData)
                .environment(\.colorScheme, .dark)
                .tabItem {
                    Label("Créer", systemImage: "plus")
                }.environment(\.colorScheme, .dark)

            DataReviewView(matchData: $matchData)
                .environment(\.colorScheme, .dark)
                .tabItem {
                    Label("Données", systemImage: "list.dash")
                }.environment(\.colorScheme, .dark)
            
            
            
            
            PexelsImageView()
                .environment(\.colorScheme, .dark)
                .tabItem {
                    Label("API Images", systemImage: "photo.stack")
                }
                .environment(\.colorScheme, .dark)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
