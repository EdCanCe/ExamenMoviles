//
//  SpellDetailView.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

import SwiftUI

struct SpellDetailView: View {
    var spell: Spell
    
    @StateObject var viewModel = SpellDetailViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(spell.name)
                .font(.title)
            
            Spacer()
                .frame(height: 20)
            
            Text("Effect: \(spell.effect)")
            Text("Incantation: \(spell.incantation ?? "No data")")
            Text("Light: \(spell.light)")
            
            Spacer()
        }
        .onAppear() {
            viewModel.setLastSpell(spell: spell.name)
        }
    }
}
