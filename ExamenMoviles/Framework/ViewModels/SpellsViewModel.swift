//
//  SpellsViewModel.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 26/11/25.
//

import Combine

class SpellsViewModel: ObservableObject {
    @Published var spellList = [Spell]()
    @Published var isLoading: Bool = false
    @Published var hasError: Bool = false
    
    var spellRequirement: SpellsRequirementProtocol
    
    init(spellRequirement: SpellsRequirementProtocol = SpellsRequirement.shared) {
        self.spellRequirement = spellRequirement
    }
    
    func getSpells() async {
        isLoading = true
        do {
            spellList = try await spellRequirement.getSpells()
            isLoading = false
        } catch {
            hasError = true
            isLoading = false
        }
    }
}
