//
//  ProfileRepository.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

import Foundation

protocol ProfileProtocol {
    func getLastHouse() -> String?
    func setLastHouse(house: String)
    func getLastWizard() -> String?
    func setLastWizard(wizard: String)
    func getLastSpell() -> String?
    func setLastSpell(spell: String)
}

class ProfileRepository: ProfileProtocol {
    let service: ProfileService
    static let shared = ProfileRepository()
    
    init(service: ProfileService = ProfileService.shared) {
        self.service = service
    }
    
    func getLastHouse() -> String? {
        return service.getLastHouse()
    }
    
    func setLastHouse(house: String) {
        service.setLastHouse(house: house)
    }
    
    func getLastWizard() -> String? {
        return service.getLastWizard()
    }
    
    func setLastWizard(wizard: String) {
        service.setLastWizard(wizard: wizard)
    }
    
    func getLastSpell() -> String? {
        return service.getLastSpell()
    }
    
    func setLastSpell(spell: String) {
        service.setLastSpell(spell: spell)
    }
}
