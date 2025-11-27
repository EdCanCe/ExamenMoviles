//
//  HousesRequirement.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 26/11/25.
//

import Foundation

protocol HousesRequirementProtocol {
    func getHouses() async throws -> [House]
}

class HousesRequirement: HousesRequirementProtocol {
    let dataRepository: HarryPotterRepository
    static let shared = HousesRequirement()
    
    init(dataRepository: HarryPotterRepository = HarryPotterRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getHouses() async throws -> [House] {
        do {
            return try await dataRepository.getHouses()
        } catch {
            throw error
        }
    }
}
