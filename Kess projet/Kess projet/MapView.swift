////
////  MapView.swift
////  Kess projet
////
////  Created by HUON Kieran on 22/11/2023.
////
//
//
//import SwiftUI
//
//// Structure pour une map
//struct Map {
//    let name: String
//    let imageName: String
//    var isSelected: Bool = false
//}
//
//// ViewModel pour la sélection des maps
//class MapSelectionViewModel: ObservableObject {
//    @Published var maps: [Map]
//    @Published var ruleName: String = ""
//
//    init(maps: [Map]) {
//        self.maps = maps
//    }
//}
//
//// Vue pour la sélection des maps
//struct MapSelectionView: View {
//    @ObservedObject var viewModel: MapSelectionViewModel
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                TextField("Nom de la règle", text: $viewModel.ruleName)
//                    .padding()
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                List(viewModel.maps.indices, id: \.self) { index in
//                    HStack {
//                        Image(viewModel.maps[index].imageName)
//                            .resizable()
//                            .frame(width: 50, height: 50)
//                        Text(viewModel.maps[index].name)
//                        Spacer()
//                        if viewModel.maps[index].isSelected {
//                            Image(systemName: "checkmark")
//                        }
//                    }
//                    .onTapGesture {
//                        viewModel.maps[index].isSelected.toggle()
//                    }
//                }
//            }
//            .navigationBarTitle("Sélection des Maps")
//        }
//    }
//}
//
//// Preview de MapSelectionView
//struct MapSelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        let maps = [
//            Map(name: "Champs de bataille", imageName: "SSBU-Battlefield"),
//            Map(name: "Destination finale", imageName: "SSBU-Final_Destination"),
//            Map(name: "Petit champs de bataille", imageName: "SSBU-Small-Battlefield"),
//            Map(name: "Pokemon Stadium 2", imageName: "SSBU-Pokémon_Stadium_2"),
//            Map(name: "Yoshi's Story", imageName: "SSBU-Yoshi's_Story"),
//            Map(name: "Smash ville", imageName: "SSBU-Smashville"),
////            Map(name: "Laylat", imageName: "SSBU-Lylat"),
//            Map(name: "Town & City", imageName: "SSBU-Town_and_City"),
//            Map(name: "Kalos", imageName: "SSBU-Kalos"),
//            Map(name: "Hollow Bastion", imageName: "SSBU-Hollow_Bastion")
////            Map(name: "Northern Cave", imageName: "SSBU_Northern_Cave")
//        ]
//        MapSelectionView(viewModel: MapSelectionViewModel(maps: maps))
//    }
//}
//import SwiftUI
//
//// Structure pour une map
//struct Map {
//    let name: String
//    let imageName: String
//    var isBanned: Bool = false
//    var isSelected: Bool = false
//}
//
//// ViewModel pour la sélection des maps
//class MapSelectionViewModel: ObservableObject {
//    @Published var maps: [Map]
//    @Published var ruleName: String = ""
//    @Published var currentPlayer: Int = 1
//    @Published var remainingBans: Int = 3
//
//    init(maps: [Map]) {
//        self.maps = maps
//    }
//
//    func banMap(at index: Int) {
//        if remainingBans > 0 && !maps[index].isBanned {
//            maps[index].isBanned = true
//            remainingBans -= 1
//
//            if remainingBans == 0 {
//                if currentPlayer == 1 {
//                    currentPlayer = 2
//                    remainingBans = 4
//                } else if currentPlayer == 2 {
//                    currentPlayer = 1
//                    remainingBans = 1 // Pour le choix final
//                }
//            }
//        } else if currentPlayer == 1 && remainingBans == 1 && !maps[index].isBanned {
//            maps[index].isSelected = true
//            remainingBans = 0
//        }
//    }
//}
//// Vue pour la sélection des maps
//struct MapSelectionView: View {
//    @ObservedObject var viewModel: MapSelectionViewModel
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                TextField("Nom de la règle", text: $viewModel.ruleName)
//                    .padding()
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                Text("J\(viewModel.currentPlayer) ban \(viewModel.remainingBans) maps")
//                    .padding()
//                    .font(.headline)
//
//                List(viewModel.maps.indices, id: \.self) { index in
//                    HStack {
//                        Image(viewModel.maps[index].imageName)
//                            .resizable()
//                            .frame(width: 50, height: 50)
//                        Text(viewModel.maps[index].name)
//                        Spacer()
//                        if viewModel.maps[index].isBanned {
//                            Image(systemName: "xmark.circle")
//                                .foregroundColor(.red)
//                        }
//                        if viewModel.maps[index].isSelected {
//                            Image(systemName: "checkmark.circle")
//                                .foregroundColor(.green)
//                        }
//                    }
//                    .onTapGesture {
//                        viewModel.banMap(at: index)
//                    }
//                }
//            }
//            .navigationBarTitle("Sélection des Maps")
//        }
//        .environment(\.colorScheme, .dark) // Appliquer le mode sombre
//    }
//}
//
//// Preview de MapSelectionView
//struct MapSelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        let maps = [
//                    Map(name: "Champs de bataille", imageName: "SSBU-Battlefield"),
//                    Map(name: "Destination finale", imageName: "SSBU-Final_Destination"),
//                    Map(name: "Petit champs de bataille", imageName: "SSBU-Small-Battlefield"),
//                    Map(name: "Pokemon Stadium 2", imageName: "SSBU-Pokémon_Stadium_2"),
//                    Map(name: "Yoshi's Story", imageName: "SSBU-Yoshi's_Story"),
//                    Map(name: "Smash ville", imageName: "SSBU-Smashville"),
//        //            Map(name: "Laylat", imageName: "SSBU-Lylat"),
//                    Map(name: "Town & City", imageName: "SSBU-Town_and_City"),
//                    Map(name: "Kalos", imageName: "SSBU-Kalos"),
//                    Map(name: "Hollow Bastion", imageName: "SSBU-Hollow_Bastion")
//        //            Map(name: "Northern Cave", imageName: "SSBU_Northern_Cave")
//                ]
//
//        MapSelectionView(viewModel: MapSelectionViewModel(maps: maps))
//    }
//}
import SwiftUI

struct Map {
    let name: String
    let imageName: String
    var isBanned: Bool = false
    var isSelected: Bool = false
}

class MapSelectionViewModel: ObservableObject {
    @Published var maps: [Map]
    @Published var ruleName: String = ""
    @Published var currentPlayer: Int = 1
    @Published var remainingBans: Int = 3
    @Published var selectionPhase: SelectionPhase = .banning

    enum SelectionPhase {
        case banning, choosing, finished
    }

    init(maps: [Map]) {
        self.maps = maps
    }

    func banMap(at index: Int) {
        switch selectionPhase {
        case .banning where remainingBans > 0 && !maps[index].isBanned:
            maps[index].isBanned = true
            remainingBans -= 1

            if remainingBans == 0 {
                if currentPlayer == 1 {
                    currentPlayer = 2
                    remainingBans = 4
                } else {
                    selectionPhase = .choosing
                    currentPlayer = 1
                    remainingBans = 1
                }
            }

        case .choosing where currentPlayer == 1 && remainingBans == 1 && !maps[index].isBanned:
            maps[index].isSelected = true
            selectionPhase = .finished
            remainingBans = 0

        default:
            break
        }
    }

    func resetSelection() {
        for index in maps.indices {
            maps[index].isBanned = false
            maps[index].isSelected = false
        }
        currentPlayer = 1
        remainingBans = 3
        selectionPhase = .banning
    }
}

struct MapSelectionView: View {
    @ObservedObject var viewModel: MapSelectionViewModel

    var body: some View {
        NavigationView {
            VStack {
                TextField("Nom de la règle", text: $viewModel.ruleName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                if viewModel.selectionPhase == .choosing {
                    Text("J\(viewModel.currentPlayer) choix de la map")
                } else if viewModel.selectionPhase == .banning {
                    Text("J\(viewModel.currentPlayer) ban \(viewModel.remainingBans) maps")
                }
                

                List(viewModel.maps.indices, id: \.self) { index in
                    HStack {
                        Image(viewModel.maps[index].imageName)
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text(viewModel.maps[index].name)
                        Spacer()
                        if viewModel.maps[index].isBanned {
                            Image(systemName: "xmark.circle")
                                .foregroundColor(.red)
                        }
                        if viewModel.maps[index].isSelected {
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(.green)
                        }
                    }
                    .onTapGesture {
                        viewModel.banMap(at: index)
                    }
                }

                if viewModel.selectionPhase == .finished {
                    Button("Réinitialiser", action: viewModel.resetSelection)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .navigationBarTitle("Sélection des Maps")
        }
        .background(Color.black.opacity(0.5))
        .environment(\.colorScheme, .dark) // Mode sombre appliqué
    }
}
struct MapSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        let maps = [
                            Map(name: "Champs de bataille", imageName: "SSBU-Battlefield"),
                            Map(name: "Destination finale", imageName: "SSBU-Final_Destination"),
                            Map(name: "Petit champs de bataille", imageName: "SSBU-Small-Battlefield"),
                            Map(name: "Pokemon Stadium 2", imageName: "SSBU-Pokémon_Stadium_2"),
                            Map(name: "Yoshi's Story", imageName: "SSBU-Yoshi's_Story"),
                            Map(name: "Smash ville", imageName: "SSBU-Smashville"),
                //            Map(name: "Laylat", imageName: "SSBU-Lylat"),
                            Map(name: "Town & City", imageName: "SSBU-Town_and_City"),
                            Map(name: "Kalos", imageName: "SSBU-Kalos"),
                            Map(name: "Hollow Bastion", imageName: "SSBU-Hollow_Bastion")
                //            Map(name: "Northern Cave", imageName: "SSBU_Northern_Cave")
                        ]
        MapSelectionView(viewModel: MapSelectionViewModel(maps: maps))
    }
}
