//
//  GenerateSudokuView.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

import SwiftUI

struct GenerateSudokuView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel: SudokuViewModel
    
    @State var difficulty: Difficulty?
    @State var size: Size?
    
    @State var hasPopup: Bool = false
    
    var body: some View {
        List {
            Picker("Escoja la dificultad", selection: $difficulty) {
                Text("Fácil").tag(Difficulty.easy)
                Text("Medio").tag(Difficulty.medium)
                Text("Difícil").tag(Difficulty.hard)
            }
            
            Picker("Escoja el tamaño del tablero", selection: $size) {
                Text("2 x 2").tag(Size.fours)
                Text("3 x 3").tag(Size.nines)
            }
        }
        .alert("Necesita llenar todos los campos.", isPresented: $hasPopup) {
            Button("Entendido", role: .cancel) {
                hasPopup = false
            }
        }
        
        List {
            Button("Generar tablero") {
                if size == nil || difficulty == nil {
                    hasPopup = true
                    return
                }
                
                // Ir a la pestaña anterior
                dismiss()
                
                Task {
                    await viewModel.getItems(size: size ?? Size.fours, difficulty: difficulty ?? Difficulty.easy)
                }
            }
        }
        
        Spacer()
    }
}
