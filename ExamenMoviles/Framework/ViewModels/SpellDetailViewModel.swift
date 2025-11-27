//
//  SpellDetailViewModel.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

import Combine

class SpellDetailViewModel: ObservableObject {
    var profileRequirement: ProfileRequirementProtocol
    
    init(profileRequirement: ProfileRequirementProtocol = ProfileRequirement.shared) {
        self.profileRequirement = profileRequirement
    }
    
    func setLastSpell(spell: String) {
        profileRequirement.setLastSpell(spell: spell)
    }
}
