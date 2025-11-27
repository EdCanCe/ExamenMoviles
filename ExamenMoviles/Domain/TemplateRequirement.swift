//
//  TemplateRequirement.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 26/11/25.
//

import Foundation

protocol TemplateRequirementProtocol {
    func getItems() async throws -> [Item]
}

class TemplateRequirement: TemplateRequirementProtocol {
    let dataRepository: TemplateRepository
    static let shared = TemplateRequirement()
    
    init(dataRepository: TemplateRepository = TemplateRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getItems() async throws -> [Item] {
        do {
            return try await dataRepository.getItems()
        } catch {
            throw error
        }
    }
}
