//
//  SudokuRepository.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

import Foundation

struct SudokuAPI {
    static let base = "https://api.api-ninjas.com/v1/"
    
    struct Routes {
        static let generate = "sudokugenerate"
    }
}

protocol SudokuAPIProtocol {
    func getNewSudoku(width: Int, height: Int, difficulty: String) async throws -> Sudoku
}

class SudokuRepository: SudokuAPIProtocol {
    let service: SudokuAPIService
    static let shared = SudokuRepository()
    
    init(service: SudokuAPIService = SudokuAPIService.shared) {
        self.service = service
    }
        
    func getNewSudoku(width: Int, height: Int, difficulty: String) async throws -> Sudoku {
        do {
            return try await service.getBoard(url: URL(string: "\(SudokuAPI.base)\(SudokuAPI.Routes.generate)")!, width: width, height: height, difficulty: difficulty)
        } catch {
            throw error
        }
    }
}
