//
//  HousesView.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 26/11/25.
//

import SwiftUI

struct HousesView: View {
    @StateObject var viewModel = HousesViewModel()
    
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
                    List(viewModel.housesList) { house in
                        NavigationLink {
                            HouseDetailView(house: house)
                        } label: {
                            VStack(alignment: .center) {
                                Text(house.name)
                            }
                        }
                    }
                }
            }
        }
        .onAppear() {
            Task {
                await viewModel.getHouses()
            }
        }
    }
}

#Preview {
    HousesView()
}
