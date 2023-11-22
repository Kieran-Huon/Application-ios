//
//  MapView.swift
//  Kess projet
//
//  Created by HUON Kieran on 22/11/2023.
//


import SwiftUI

// Structure pour une map
struct Map {
    let name: String
    let imageName: String
    var isSelected: Bool = false
}

// ViewModel pour la sélection des maps
class MapSelectionViewModel: ObservableObject {
    @Published var maps: [Map]
    @Published var ruleName: String = ""

    init(maps: [Map]) {
        self.maps = maps
    }
}

// Vue pour la sélection des maps
struct MapSelectionView: View {
    @ObservedObject var viewModel: MapSelectionViewModel

    var body: some View {
        NavigationView {
            VStack {
                TextField("Nom de la règle", text: $viewModel.ruleName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                List(viewModel.maps.indices, id: \.self) { index in
                    HStack {
                        Image(viewModel.maps[index].imageName)
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text(viewModel.maps[index].name)
                        Spacer()
                        if viewModel.maps[index].isSelected {
                            Image(systemName: "checkmark")
                        }
                    }
                    .onTapGesture {
                        viewModel.maps[index].isSelected.toggle()
                    }
                }
            }
            .navigationBarTitle("Sélection des Maps")
        }
    }
}

// Preview de MapSelectionView
struct MapSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        let maps = [
            Map(name: "Champs de bataille", imageName: "SSBU-Battlefield"),
            Map(name: "Destination finale", imageName: "SSBU-Final_Destination"),
            Map(name: "Petit champs de bataille", imageName: "SSBU-Small-Battlefield"),
            Map(name: "Pokemon Stadium 2", imageName: "SSBU-Pokémon_Stadium_2"),
            Map(name: "Yoshi's Story", imageName: "SSBU-Yoshi's_Story"),
            Map(name: "Smash ville", imageName: "SSBU-Smashville"),
            Map(name: "Laylat", imageName: "SSBU-Lylat"),
            Map(name: "Town & City", imageName: "SSBU-Town_and_City"),
            Map(name: "Kalos", imageName: "SSBU-Kalos"),
            Map(name: "Hollow Bastion", imageName: "SSBU-Hollow_Bastion"),
            Map(name: "Northern Cave", imageName: "SSBU_Northern_Cave")
        ]
        MapSelectionView(viewModel: MapSelectionViewModel(maps: maps))
    }
}
