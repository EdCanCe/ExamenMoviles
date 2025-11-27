//
//  HouseDetailViewModel.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

import Combine

class HouseDetailViewModel: ObservableObject {
    var profileRequirement: ProfileRequirementProtocol
    
    init(profileRequirement: ProfileRequirementProtocol = ProfileRequirement.shared) {
        self.profileRequirement = profileRequirement
    }
    
    func setLastHouse(house: String) {
        profileRequirement.setLastHouse(house: house)
    }
}
