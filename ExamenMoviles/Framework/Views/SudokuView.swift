//
//  SudokuView.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

import SwiftUI

struct SudokuView: View {
    @StateObject var viewModel = SudokuViewModel()
        
    var body: some View {
        NavigationStack {
            
            Spacer()
            Spacer()
            
            if viewModel.isLoading {
                Text("Obteniendo nuevo tablero...")
                    .foregroundStyle(.gray)
            } else if viewModel.hasError {
                Text("Hubo un error en la búsqueda")
                    .foregroundStyle(.red)
            } else if viewModel.sudoku.puzzle.isEmpty {
                Text("Genere un sudoku")
                    .font(.title)
                    .fontWeight(.bold)
            } else {
                VStack(spacing: 8) {
                    ForEach (viewModel.sudoku.puzzle, id: \.self) { row in
                        HStack(spacing: 8) {
                            ForEach (row, id: \.self) { element in
                                // Tiene valor
                                if let val = element.value {
                                    Text("\(val)")
                                        .frame(width: viewModel.squareSize, height: viewModel.squareSize)
                                        .background(element.isClear ? .clear : Color.gray.opacity(0.2))
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(.gray, lineWidth: 1))
                                } else {
                                    Text("AA")
                                        //.keyboardType(type.keyboardType)
                                        .frame(width: viewModel.squareSize, height: viewModel.squareSize)
                                        .background(element.isClear ? .clear : Color.gray.opacity(0.2))
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(.gray, lineWidth: 1))
                                }
                            }
                        }
                    }
                }
            }
            
            Spacer()
            
            NavigationLink("Generar nuevo tablero", destination: GenerateSudokuView(viewModel: viewModel))
                .frame(maxWidth: .infinity)
                .padding(10)
                .background(Color(UIColor.systemGray6))
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal, 24)
            
            Spacer()
            Spacer()
        }
    }
}

#Preview {
    SudokuView()
}
