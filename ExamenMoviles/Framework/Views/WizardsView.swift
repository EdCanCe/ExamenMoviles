//
//  WizardsView.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 26/11/25.
//

import SwiftUI

struct WizardsView: View {
    @StateObject var viewModel = WizardsViewModel()
    
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
                    List(viewModel.wizardList) { wizard in
                        NavigationLink {
                            WizardDetailView(wizard: wizard)
                        } label: {
                            VStack(alignment: .center) {
                                Text(wizard.name)
                            }
                        }
                    }
                }
            }
        }
        .onAppear() {
            Task {
                await viewModel.getWizards()
            }
        }
    }
}

#Preview {
    WizardsView()
}
