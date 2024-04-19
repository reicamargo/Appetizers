//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 19/04/24.
//

import Foundation

class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var showAlert = false
    
    //ver se funciona com o @MainActor
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let appetizers): self.appetizers = appetizers
                    
                    case .failure(let error):
                        self.showAlert = true
                        switch error {
                            case .invalidData:
                                self.alertItem = AlertContext.invalidData
                            case .invalidURL:
                                self.alertItem = AlertContext.invalidURL
                            case .invalidResponse:
                                self.alertItem = AlertContext.invalidResponse
                            case .unableToComplete:
                                self.alertItem = AlertContext.unableToComplete
                        }
                }
            }
        }
    }
}
