//
//  ProfileService.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

import Foundation

class ProfileService {
    static let shared = ProfileService()
    
    func getLastHouse() -> String? {
        return UserDefaults.standard.string(forKey: "lastHouse")
    }

    func setLastHouse(house: String) {
        UserDefaults.standard.set(house, forKey: "lastHouse")
    }
    
    func getLastWizard() -> String? {
        return UserDefaults.standard.string(forKey: "lastWizard")
    }

    func setLastWizard(wizard: String) {
        UserDefaults.standard.set(wizard, forKey: "lastWizard")
    }
    
    func getLastSpell() -> String? {
        return UserDefaults.standard.string(forKey: "lastSpell")
    }

    func setLastSpell(spell: String) {
        UserDefaults.standard.set(spell, forKey: "lastSpell")
    }

}
