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
            // Código de tablero
            
            NavigationLink("Generar nuevo tablero", destination: GenerateSudokuView(viewModel: viewModel))
            
            if viewModel.isLoading {
                Text("Obteniendo nuevo tablero...")
            } else if viewModel.hasError {
                Text("Hubo un error en la búsqueda")
            } else {
                
            }
        }
    }
}

#Preview {
    SudokuView()
}
