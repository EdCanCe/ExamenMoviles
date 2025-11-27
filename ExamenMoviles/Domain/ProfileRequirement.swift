//
//  ProfileRequirement.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

protocol ProfileRequirementProtocol {
    func getLastHouse() -> String?
    func setLastHouse(house: String)
    func getLastWizard() -> String?
    func setLastWizard(wizard: String)
    func getLastSpell() -> String?
    func setLastSpell(spell: String)
}

class ProfileRequirement: ProfileRequirementProtocol {
    let dataRepository: ProfileRepository
    static let shared = ProfileRequirement()
    
    init(dataRepository: ProfileRepository = ProfileRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getLastHouse() -> String? {
        return dataRepository.getLastHouse()
    }
    
    func setLastHouse(house: String) {
        dataRepository.setLastHouse(house: house)
    }
    
    func getLastWizard() -> String? {
        return dataRepository.getLastWizard()
    }
    
    func setLastWizard(wizard: String) {
        dataRepository.setLastWizard(wizard: wizard)
    }
    
    func getLastSpell() -> String? {
        return dataRepository.getLastSpell()
    }
    
    func setLastSpell(spell: String) {
        dataRepository.setLastSpell(spell: spell)
    }
}
