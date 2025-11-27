//
//  HarryPotterRepository.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 26/11/25.
//

import Foundation

struct HarryPotterAPI {
    static let base = "https://wizard-world-api.herokuapp.com/"
    
    struct Routes {
        static let wizards = "Wizards"
        static let houses = "Houses"
        static let spells = "Spells"
    }
}

protocol HarryPotterAPIProtocol {
    func getHouses() async throws -> [House]
    func getWizards() async throws -> [Wizard]
    func getSpells() async throws -> [Spell]
}

class HarryPotterRepository: HarryPotterAPIProtocol {
    let service: HarryPotterAPIService
    static let shared = HarryPotterRepository()
    
    private var houseStorage: [House] = []
    private var wizardStorage: [Wizard] = []
    private var spellStorage: [Spell] = []
    
    init(service: HarryPotterAPIService = HarryPotterAPIService.shared) {
        self.service = service
    }
    
    func getHouses() async throws -> [House] {
        if !houseStorage.isEmpty {
            return houseStorage
        }
        
        do {
            houseStorage = try await service.getHouses(url: URL(string: "\(HarryPotterAPI.base)\(HarryPotterAPI.Routes.houses)")!)
            return houseStorage
        } catch {
            throw error
        }
    }
    
    func getWizards() async throws -> [Wizard] {
        if !wizardStorage.isEmpty {
            return wizardStorage
        }
        
        do {
            wizardStorage = try await service.getWizards(url: URL(string: "\(HarryPotterAPI.base)\(HarryPotterAPI.Routes.wizards)")!)
            return wizardStorage
        } catch {
            throw error
        }
    }
    
    func getSpells() async throws -> [Spell] {
        if !spellStorage.isEmpty {
            return spellStorage
        }
        
        do {
            spellStorage = try await service.getSpells(url: URL(string: "\(HarryPotterAPI.base)\(HarryPotterAPI.Routes.spells)")!)
            return spellStorage
        } catch {
            throw error
        }
    }
}
