//
//  CoordinatorView.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 27/11/25.
//

import SwiftUI

struct CoordinatorView: View {
    var body: some View {
        TabView {
            HousesView()
                .tabItem() {
                    Label("Houses", systemImage: "house")
                }
            
            SpellsView()
                .tabItem() {
                    Label("Spells", systemImage: "wand.and.sparkles")
                }
            
            WizardsView()
                .tabItem() {
                    Label("Wizards", systemImage: "hands.and.sparkles")
                }
            
            ProfileView()
                .tabItem() {
                    Label("Myself", systemImage: "person")
                }
        }
    }
}

#Preview {
    CoordinatorView()
}
