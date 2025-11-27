//
//  SudokuInfo.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

import Foundation

struct Sudoku: Codable {
    var rows: [Row]
}

struct Row: Codable {
    var data: [Int?]
}
