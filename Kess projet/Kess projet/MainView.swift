//
//  MainView.swift
//  Kess projet
//
//  Created by HUON Kieran on 21/11/2023.
//

// MainView.swift

import SwiftUI

struct MainView: View {
    @State private var matchData: [Match] = [] // Gestion des données de match

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
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

