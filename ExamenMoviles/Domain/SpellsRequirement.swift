//
//  SpellsRequirement.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 26/11/25.
//

import Foundation

protocol SpellsRequirementProtocol {
    func getSpells() async throws -> [Spell]
}

class SpellsRequirement: SpellsRequirementProtocol {
    let dataRepository: HarryPotterRepository
    static let shared = SpellsRequirement()
    
    init(dataRepository: HarryPotterRepository = HarryPotterRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getSpells() async throws -> [Spell] {
        do {
            return try await dataRepository.getSpells()
        } catch {
            throw error
        }
    }
}
