import SwiftUI

struct MainView: View {
    @State private var matchData: [Match] = []

    var body: some View {
        TabView {
            
            ContentView(matchData: $matchData)
                .tabItem {
                    Label("Créer", systemImage: "plus")
                }

            DataReviewView(matchData: $matchData)
                .tabItem {
                    Label("Données", systemImage: "list.dash")
                }
//            MapSelectionView(viewModel: MapSelectionViewModel(maps: [
//                Map(name: "Champs de bataille", imageName: "SSBU-Battlefield"),
//                Map(name: "Destination finale", imageName: "SSBU-Final_Destination"),
//                Map(name: "Petit champs de bataille", imageName: "SSBU-Small-Battlefield"),
//                Map(name: "Pokemon Stadium 2", imageName: "SSBU-Pokémon_Stadium_2"),
//                Map(name: "Yoshi's Story", imageName: "SSBU-Yoshi's_Story"),
//                Map(name: "Smash ville", imageName: "SSBU-Smashville"),
//                Map(name: "Laylat", imageName: "SSBU-Lylat"),
//                Map(name: "Town & City", imageName: "SSBU-Town_and_City"),
//                Map(name: "Kalos", imageName: "SSBU-Kalos"),
//                Map(name: "Hollow Bastion", imageName: "SSBU-Hollow_Bastion"),
//                Map(name: "Northern Cave", imageName: "SSBU_Northern_Cave")
//                        ]))
//                        .tabItem {
//                            Image("stage")
//                            .renderingMode(.template)
//                            .resizable()
//                            .frame(width: 5, height: 5)
//                            Text("Maps")
//                        }
                .tabItem {
                    Label("Calendrier", systemImage: "calendar")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
