//
//  ProfileRepository.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

import Foundation

protocol ProfileProtocol {
    func setLastGame(game: SudokuWithCoords)
    func getLastGame() throws -> SudokuWithCoords
}

class ProfileRepository: ProfileProtocol {
    let service: ProfileService
    static let shared = ProfileRepository()
    
    init(service: ProfileService = ProfileService.shared) {
        self.service = service
    }
    
    func setLastGame(game: SudokuWithCoords) {
        let data = try? JSONEncoder().encode(game)
        
        service.setLastGame(game: data ?? Data())
    }
    
    func getLastGame() throws -> SudokuWithCoords {
        do {
            return try service.getLastGame()
        } catch {
            print("the data had this \(error)")
            throw error
        }
    }
}
