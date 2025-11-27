//
//  WizardDetailViewModel.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

import Combine

class WizardDetailViewModel: ObservableObject {
    var profileRequirement: ProfileRequirementProtocol
    
    init(profileRequirement: ProfileRequirementProtocol = ProfileRequirement.shared) {
        self.profileRequirement = profileRequirement
    }
    
    func setLastWizard(wizard: String) {
        profileRequirement.setLastWizard(wizard: wizard)
    }
}
