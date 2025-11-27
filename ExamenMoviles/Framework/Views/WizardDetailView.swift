//
//  WizardDetailView.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

import SwiftUI

struct WizardDetailView: View {
    var wizard: FullWizard
    
    @StateObject var viewModel = WizardDetailViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(wizard.name)
                .font(.title)
            
            Spacer()
                .frame(height: 20)
            
            HStack {
                Text("Lista de elíxires compuestos:")
            }
            
            let elixirs = wizard.wizard.elixirs ?? []
            if elixirs.isEmpty {
                Text("Sin elíxires")
            } else {
                List(elixirs) { elixir in
                    Text(elixir.name)
                }
            }
            
            Spacer()
        }
        .onAppear() {
            viewModel.setLastWizard(wizard: wizard.name)
        }
    }
}
