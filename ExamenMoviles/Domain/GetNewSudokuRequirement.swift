//
//  GetNewSudokuRequirement.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

import Foundation

enum Difficulty {
    case easy
    case medium
    case hard
    
    var query: String {
        switch self {
        case .easy:
            return "easy"
        case .medium:
            return "medium"
        case .hard:
            return "hard"
        }
    }
}

enum Size {
    case fours
    case nines
    
    var query: Int {
        switch self {
        case .fours:
            return 2
        case .nines:
            return 3
        }
    }
}

protocol GetNewSudokuRequirementProtocol {
    func getNewSudoku(size: Size, difficulty: Difficulty) async throws -> Sudoku
}

class GetNewSudokuRequirement: GetNewSudokuRequirementProtocol {
    let dataRepository: SudokuRepository
    static let shared = GetNewSudokuRequirement()
    
    init(dataRepository: SudokuRepository = SudokuRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getNewSudoku(size: Size, difficulty: Difficulty) async throws -> Sudoku {
        do {
            return try await dataRepository.getNewSudoku(width: size.query, height: size.query, difficulty: difficulty.query)
        } catch {
            throw error
        }

    }
}
