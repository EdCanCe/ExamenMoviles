//
//  ProfileRequirement.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

protocol ProfileRequirementProtocol {
    func setLastGame(game: SudokuWithCoords)
    func getLastGame() throws -> SudokuWithCoords
}

class ProfileRequirement: ProfileRequirementProtocol {
    let dataRepository: ProfileRepository
    static let shared = ProfileRequirement()
    
    init(dataRepository: ProfileRepository = ProfileRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func setLastGame(game: SudokuWithCoords) {
        dataRepository.setLastGame(game: game)
    }
    
    func getLastGame() throws -> SudokuWithCoords {
        do {
            return try dataRepository.getLastGame()
        } catch {
            print("the data had this \(error)")
            throw error
        }
    }
}
