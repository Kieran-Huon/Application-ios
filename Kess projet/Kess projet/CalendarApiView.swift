import SwiftUI

struct TournamentView: View {
    @ObservedObject var viewModel = TournamentViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.tournaments) { tournament in
                VStack(alignment: .leading) {
                    Text(tournament.name)
                        .font(.headline)
                    Text("Date: \(tournament.date)")
                    Text("Lieu: \(tournament.location)")
                }
            }
            .navigationTitle("Tournois Smash en France")
            .onAppear {
                viewModel.loadTournaments()
            }
        }
    }
}

import Foundation

class TournamentViewModel: ObservableObject {
    @Published var tournaments: [Tournament] = []

    func loadTournaments() {
        // Code pour charger les tournois depuis l'API
        // Filtrez les résultats pour obtenir uniquement les tournois en France
    }
}

struct Tournament: Identifiable {
    let id: String
    let name: String
    let date: String
    let location: String
}

