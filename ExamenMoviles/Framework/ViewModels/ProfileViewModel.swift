//
//  ProfileViewModel.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

import Combine

class ProfileViewModel: ObservableObject {
    @Published var lastHouse: String = ""
    @Published var lastWizard: String = ""
    @Published var lastSpell: String = ""
    
    var profileRequirement: ProfileRequirementProtocol
    
    init(profileRequirement: ProfileRequirementProtocol = ProfileRequirement.shared) {
        self.profileRequirement = profileRequirement
    }
    
    func getUserData() {
        lastHouse = profileRequirement.getLastHouse() ?? "No data"
        lastWizard = profileRequirement.getLastWizard() ?? "No data"
        lastSpell = profileRequirement.getLastSpell() ?? "No data"
    }
}
