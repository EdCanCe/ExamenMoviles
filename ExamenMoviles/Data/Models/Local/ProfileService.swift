//
//  ProfileService.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

import Foundation

class ProfileService {
    static let shared = ProfileService()
    
    func setLastGame(game: Data) {
        UserDefaults.standard.set(game, forKey: "lastGame")
    }
    
    func getLastGame() throws -> SudokuWithCoords {
        let data = UserDefaults.standard.data(forKey: "lastGame") ?? Data()
        do {
            let game = try JSONDecoder().decode(SudokuWithCoords.self, from: data)
            return game
        } catch {
            throw error
        }
    }

}
