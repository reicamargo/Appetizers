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
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    //ver se funciona com o @MainActor
    func getAppetizers() {
        self.isLoading = true
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                self.isLoading = false
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
