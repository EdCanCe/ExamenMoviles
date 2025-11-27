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

struct SudokuWithCoords {
    var puzzle: [[Coord]]
    var solution: [[Coord]]
}

struct Coord: Hashable{
    let value: Int?
    let x: Int
    let y: Int
    let isClear: Bool
}
