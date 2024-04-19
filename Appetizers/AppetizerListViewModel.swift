//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 19/04/24.
//

import Foundation

class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    
    //ver se funciona com o @MainActor
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let appetizers): self.appetizers = appetizers
                    case . failure(let error): print(error.localizedDescription)
                }
            }
        }
    }
}
