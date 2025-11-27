//
//  HouseDetailView.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

import SwiftUI

struct HouseDetailView: View {
    var house: House
    
    @StateObject var viewModel = HouseDetailViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(house.name)
                .font(.title)
            
            Spacer()
                .frame(height: 20)
            
            Text(house.founder)
                .opacity(0.5)
            
            Spacer()
        }
        .onAppear() {
            viewModel.setLastHouse(house: house.name)
        }
    }
}
