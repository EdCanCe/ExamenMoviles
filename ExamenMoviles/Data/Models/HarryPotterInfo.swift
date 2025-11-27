//
//  HarryPotterInfo.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 26/11/25.
//

import Foundation

struct House: Codable, Identifiable {
    var name: String
    var founder: String
    var id: String
}

struct Spell: Codable, Identifiable {
    var name: String
    var incantation: String?
    var effect: String
    var light: String
    var id: String
}

struct Wizard: Codable, Identifiable {
    var firstName: String?
    var lastName: String
    var elixirs: [Elixir]?
    var id: String
}

struct FullWizard: Identifiable {
    var wizard: Wizard
    var name: String
    var id: Int
}

struct Elixir: Codable, Identifiable {
    var name: String
    var id: String
}
