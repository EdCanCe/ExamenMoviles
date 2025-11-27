//
//  HousesViewModel.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 26/11/25.
//

import Combine

class TemplateViewModel: ObservableObject {
    @Published var itemList = [Item]()
    @Published var isLoading: Bool = false
    @Published var hasError: Bool = false
    
    var templateRequirement: TemplateRequirementProtocol
    
    init(templateRequirement: TemplateRequirementProtocol = TemplateRequirement.shared) {
        self.templateRequirement = templateRequirement
    }
    
    func getItems() async {
        isLoading = true
        do {
            itemList = try await templateRequirement.getItems()
            isLoading = false
        } catch {
            hasError = true
            isLoading = false
        }
    }
}
