//
//  WizardsRequirement.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 26/11/25.
//

import Foundation

protocol WizardsRequirementProtocol {
    func getWizards() async throws -> [Wizard]
}

class WizardsRequirement: WizardsRequirementProtocol {
    let dataRepository: HarryPotterRepository
    static let shared = WizardsRequirement()
    
    init(dataRepository: HarryPotterRepository = HarryPotterRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getWizards() async throws -> [Wizard] {
        do {
            return try await dataRepository.getWizards()
        } catch {
            throw error
        }
    }
}
