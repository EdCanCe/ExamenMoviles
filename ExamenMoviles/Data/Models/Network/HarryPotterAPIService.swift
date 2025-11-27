//
//  HarryPotterAPIService.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 26/11/25.
//

import Alamofire
import Foundation

class HarryPotterAPIService {
    static let shared = HarryPotterAPIService()
    
    func getHouses(url: URL) async throws -> [House] {
        let parameters: Parameters = [
            // Parameters
            "name": "value"
        ]
        
        let taskRequest = AF.request(url, method: .get, parameters: parameters).validate()
        let response = await taskRequest.serializingData().response
        
        switch response.result {
        case .success(let data):
            do {
                return try JSONDecoder().decode([House].self, from: data)
            } catch {
                throw error
            }
        case let .failure(error):
            debugPrint(error.localizedDescription)
            throw error
        }
    }
    
    func getSpells(url: URL) async throws -> [Spell] {

        let taskRequest = AF.request(url, method: .get).validate()
        let response = await taskRequest.serializingData().response
                
        switch response.result {
        case .success(let data):
            do {
                return try JSONDecoder().decode([Spell].self, from: data)
            } catch {
                throw error
            }
        case let .failure(error):
            debugPrint(error.localizedDescription)
            throw error
        }
    }
    
    func getWizards(url: URL) async throws -> [Wizard] {
        let taskRequest = AF.request(url, method: .get).validate()
        let response = await taskRequest.serializingData().response
        
        switch response.result {
        case .success(let data):
            do {
                return try JSONDecoder().decode([Wizard].self, from: data)
            } catch {
                throw error
            }
        case let .failure(error):
            debugPrint(error.localizedDescription)
            throw error
        }
    }
}
