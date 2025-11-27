//
//  HarryPotterRepository.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 26/11/25.
//

import Foundation

struct TemplateAPI {
    static let base = "https://localhost/"
    
    struct Routes {
        static let address = "address"
    }
}

protocol TemplateAPIProtocol {
    func getItems() async throws -> [Item]
}

class TemplateRepository: TemplateAPIProtocol {
    let service: TemplateAPIService
    static let shared = TemplateRepository()
    
    init(service: TemplateAPIService = TemplateAPIService.shared) {
        self.service = service
    }
    
    private var storage: [Item] = []
    
    func getItems() async throws -> [Item] {
        if !storage.isEmpty {
            return storage
        }
        
        do {
            storage = try await service.getSomething(url: URL(string: "\(TemplateAPI.base)\(TemplateAPI.Routes.address)")!)
            return storage
        } catch {
            throw error
        }
    }
}
