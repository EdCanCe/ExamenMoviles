//
//  WizardsViewModel.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 26/11/25.
//

import Combine

class WizardsViewModel: ObservableObject {
    @Published var wizardList = [FullWizard]()
    @Published var isLoading: Bool = false
    @Published var hasError: Bool = false
    
    var wizardRequirement: WizardsRequirementProtocol
    
    init(wizardRequirement: WizardsRequirementProtocol = WizardsRequirement.shared) {
        self.wizardRequirement = wizardRequirement
    }
    
    func getWizards() async {
        isLoading = true
        do {
            let preList = try await wizardRequirement.getWizards()
            
            var index = 0
            
            for wizard in preList {
                var name = wizard.firstName ?? ""
                if name != "" {
                    name += " "
                }
                name += wizard.lastName
                let fullWizard = FullWizard(wizard: wizard, name: name, id: index)
                index += 1
                wizardList.append(fullWizard)
            }
            
            isLoading = false
        } catch {
            hasError = true
            isLoading = false
        }
    }
}
