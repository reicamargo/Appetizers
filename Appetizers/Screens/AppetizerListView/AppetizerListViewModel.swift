//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 19/04/24.
//

import Foundation

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var showAlert = false
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?

    @MainActor
    func getAppetizers() async -> Void {
        isLoading = true
        do {
            appetizers = try await NetworkManager.shared.getAppetizers()
            isLoading = false
        } catch {
            if let apError = error as? APError {
                switch apError {
                case .invalidURL:
                    self.alertItem = AlertContext.invalidURL
                case .invalidResponse:
                    self.alertItem = AlertContext.invalidResponse
                case .invalidData:
                    self.alertItem = AlertContext.invalidData
                case .unableToComplete:
                    self.alertItem = AlertContext.unableToComplete
                }
            } else {
                alertItem = AlertContext.connectionError
            }
            isLoading = false
        }
    }
    
//        async old way
//    func getAppetizers() {
//        self.isLoading = true
//        NetworkManager.shared.getAppetizers { result in
//            DispatchQueue.main.async {
//                self.isLoading = false
//                switch result {
//                    case .success(let appetizers): self.appetizers = appetizers
//                    
//                    case .failure(let error):
//                        self.showAlert = true
//                        switch error {
//                            case .invalidData:
//                                self.alertItem = AlertContext.invalidData
//                            case .invalidURL:
//                                self.alertItem = AlertContext.invalidURL
//                            case .invalidResponse:
//                                self.alertItem = AlertContext.invalidResponse
//                            case .unableToComplete:
//                                self.alertItem = AlertContext.unableToComplete
//                        }
//                }
//            }
//        }
//    }
}
