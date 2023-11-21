//
//  Models.swift
//  Kess projet
//
//  Created by HUON Kieran on 21/11/2023.
//

import Foundation

struct Match: Identifiable, Equatable {
    let id = UUID()
    var playerName1: String
    var playerName2: String
    var characterName1: String
    var characterName2: String
    var matchFormat: String
}
