//
//  ProfileView.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("My data")
                .font(.title)
            
            Spacer()
                .frame(height: 20)
            
            Text("Last house visited: \(viewModel.lastHouse)")
            Text("Last spell visited: \(viewModel.lastSpell)")
            Text("Last wizard visited: \(viewModel.lastWizard)")
            
            Spacer()
        }
        .onAppear() {
            viewModel.getUserData()
        }
    }
}

#Preview {
    ProfileView()
}
