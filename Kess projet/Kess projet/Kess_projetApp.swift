//
//  Kess_projetApp.swift
//  Kess projet
//
//  Created by HUON Kieran on 20/11/2023.
//

import SwiftUI

@main
struct Kess_projetApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView()
            }
        }
    }
    func customizeNavigationBar() {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.black.withAlphaComponent(0.3) // Ajustez l'opacité ici
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
}
