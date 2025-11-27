//
//  HarryPotterAPIService.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 26/11/25.
//

import Alamofire
import Foundation

class TemplateAPIService {
    static let shared = TemplateAPIService()
    
    func getSomething(url: URL) async throws -> [Item] {
        let parameters: Parameters = [
            // Parameters
            "name": "value"
        ]
        
        let taskRequest = AF.request(url, method: .get, parameters: parameters).validate()
        let response = await taskRequest.serializingData().response
        
        switch response.result {
        case .success(let data):
            do {
                return try JSONDecoder().decode([Item].self, from: data)
            } catch {
                throw error
            }
        case let .failure(error):
            debugPrint(error.localizedDescription)
            throw error
        }
    }
}
