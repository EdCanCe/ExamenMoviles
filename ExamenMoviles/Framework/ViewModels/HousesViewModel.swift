//
//  HousesViewModel.swift
//  ExamenMoviles
//
//  Created by Edmundo Canedo Cervantes on 26/11/25.
//

import Combine

class HousesViewModel: ObservableObject {
    @Published var housesList = [House]()
    @Published var isLoading: Bool = false
    @Published var hasError: Bool = false
    
    var houseRequirement: HousesRequirementProtocol
    
    init(houseRequirement: HousesRequirementProtocol = HousesRequirement.shared) {
        self.houseRequirement = houseRequirement
    }
    
    func getHouses() async {
        isLoading = true
        do {
            housesList = try await houseRequirement.getHouses()
            isLoading = false
        } catch {
            hasError = true
            isLoading = false
        }
    }
}
