//
//  SpellsView.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

import SwiftUI

struct SpellsView: View {
    @StateObject var viewModel = SpellsViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
                    .frame(maxHeight: .infinity)
            } else if viewModel.hasError {
                VStack {
                    Text("Hubo un error en la búsqueda")
                }
            } else {
                NavigationView {
                    List(viewModel.spellList) { spell in
                        NavigationLink {
                            SpellDetailView(spell: spell)
                        } label: {
                            VStack(alignment: .center) {
                                Text(spell.name)
                            }
                        }
                    }
                }
            }
        }
        .onAppear() {
            Task {
                await viewModel.getSpells()
            }
        }
    }
}

#Preview {
    SpellsView()
}
