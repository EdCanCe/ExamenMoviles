//
//  SudokuInfo.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

import Foundation

struct Sudoku: Codable {
    let puzzle: [[Int?]]
    let solution: [[Int]]
}
