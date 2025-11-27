//
//  SudokuView.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

import SwiftUI

struct SudokuView: View {
    @StateObject var viewModel = SudokuViewModel()
    
    @State var showInput: Bool = false
    @State var hasPopup: Bool = false
    @State var coordX: Int = 0
    @State var coordY: Int = 0
    @State var newValue: Int?
    @State var hasVictory: Int = 0
        
    var body: some View {
        NavigationStack {
            
            Spacer()
            Spacer()
            
            if hasVictory == 1 {
                Text("Felicidades, has ganado!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.orange)
                    .padding(24)
            } else if hasVictory == 2 {
                Text("Aún no está del todo correcto")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.red)
                    .padding(24)
            }
            
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
                                } else if let val = element.input {
                                    Text("\(val)")
                                        .frame(width: viewModel.squareSize, height: viewModel.squareSize)
                                        .foregroundStyle(.gray)
                                        .background(element.isClear ? .clear : Color.gray.opacity(0.2))
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(.gray, lineWidth: 1))
                                        .onTapGesture {
                                            coordX = element.x
                                            coordY = element.y
                                            showInput = true
                                        }
                                } else {
                                    Text("")
                                        .frame(width: viewModel.squareSize, height: viewModel.squareSize)
                                        .foregroundStyle(.gray)
                                        .background(element.isClear ? .clear : Color.gray.opacity(0.2))
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(.gray, lineWidth: 1))
                                        .onTapGesture {
                                            coordX = element.x
                                            coordY = element.y
                                            showInput = true
                                        }
                                }
                            }
                        }
                    }
                    
                    Spacer()
                        .frame(height: 32)
                    
                    Button("Verificar resultados") {
                        let currentState = viewModel.verifyWin()
                        
                        if currentState == true {
                            hasVictory = 1
                        } else {
                            hasVictory = 2
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .background(Color(UIColor.systemGray6))
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal, 24)
                }
                .alert("Necesita escoger el valor.", isPresented: $hasPopup) {
                    Button("Entendido", role: .cancel) {
                        hasPopup = false
                    }
                }
                .sheet(isPresented: $showInput) {
                    VStack {
                        HStack {
                            Text("Valor:")
                            
                            Spacer()
                            
                            Picker("Escoja el valor", selection: $newValue) {
                                ForEach(1...viewModel.sudoku.puzzle.count, id: \.self) { i in
                                    Text(String(i)).tag(i)
                                }
                            }
                        }
                        
                        HStack(spacing: 8) {
                            Button("Cancelar") {
                                showInput = false
                            }
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .background(.red.opacity(0.4))
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                            Button("Guardar") {
                                if newValue == nil {
                                    hasPopup = true
                                    return
                                }
                                
                                showInput = false
                                viewModel.saveCell(x: coordX, y: coordY, value: newValue ?? 0)
                                newValue = nil
                                hasVictory = 0
                            }
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .background(Color(UIColor.systemGray6))
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        
                    }
                    .padding(.horizontal, 24)
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
