//
//  SudokuViewModel.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

import Combine
import Foundation

class SudokuViewModel: ObservableObject {
    @Published var sudoku: SudokuWithCoords = SudokuWithCoords(puzzle: [], solution: [])
    @Published var isLoading: Bool = false
    @Published var hasError: Bool = false
    @Published var squareSize: CGFloat = 0
    
    var getNewSudokuRequirement: GetNewSudokuRequirementProtocol
    
    init(getNewSudokuRequirement: GetNewSudokuRequirementProtocol = GetNewSudokuRequirement.shared) {
        self.getNewSudokuRequirement = getNewSudokuRequirement
    }
    
    func getItems(size: Size, difficulty: Difficulty) async {
        isLoading = true
        do {
            let baseSudoku: Sudoku = try await getNewSudokuRequirement.getNewSudoku(size: size, difficulty: difficulty)
            sudoku = SudokuWithCoords(puzzle: [], solution: [])
            
            let fullSize = size.query * size.query

            for i in 0..<fullSize {
                var row: [Coord] = []
                var rowSol: [Coord] = []
                for j in 0..<fullSize {
                    let isClear: Bool = (i / size.query + j / size.query) % 2 == 1

                    row.append(Coord(value: baseSudoku.puzzle[i][j], x: i, y: j, isClear: isClear))
                    rowSol.append(Coord(value: baseSudoku.solution[i][j], x: i, y: j, isClear: isClear))
                }

                sudoku.puzzle.append(row)
                sudoku.solution.append(rowSol)
            }
            
            squareSize = size == .fours ? 56 : 32
            isLoading = false
        } catch {
            hasError = true
            isLoading = false
        }
    }
}
