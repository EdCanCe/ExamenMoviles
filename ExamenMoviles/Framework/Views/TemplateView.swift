//
//  TemplateView.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 26/11/25.
//

import SwiftUI

struct TemplateView: View {
    @StateObject var viewModel = TemplateViewModel()
    
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
                    List(viewModel.itemList) { item in
                        NavigationLink {
                            // Page
                            Text("aa")
                        } label: {
                            VStack(alignment: .center) {
                                Text(item.name)
                            }
                        }
                    }
                }
            }
        }
        .onAppear() {
            Task {
                await viewModel.getItems()
            }
        }
    }
}

#Preview {
    TemplateView()
}
