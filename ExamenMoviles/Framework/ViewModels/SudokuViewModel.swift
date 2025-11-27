//
//  SudokuViewModel.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

import Combine

class SudokuViewModel: ObservableObject {
    @Published var sudoku: Sudoku = Sudoku(puzzle: [], solution: [])
    @Published var isLoading: Bool = false
    @Published var hasError: Bool = false
    
    var getNewSudokuRequirement: GetNewSudokuRequirementProtocol
    
    init(getNewSudokuRequirement: GetNewSudokuRequirementProtocol = GetNewSudokuRequirement.shared) {
        self.getNewSudokuRequirement = getNewSudokuRequirement
    }
    
    func getItems(size: Size, difficulty: Difficulty) async {
        isLoading = true
        do {
            sudoku = try await getNewSudokuRequirement.getNewSudoku(size: size, difficulty: difficulty)
            isLoading = false
        } catch {
            hasError = true
            isLoading = false
        }
    }
}
