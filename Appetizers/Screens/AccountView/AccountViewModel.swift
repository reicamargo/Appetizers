//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 20/04/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    @Published var showAlert = false
    
    private var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            self.alertItem = AlertContext.emptyField
            showAlert = true
            return false
        }
        
        guard user.email.isValidEmail else {
            self.alertItem = AlertContext.invalidEmail
            showAlert = true
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            self.alertItem = AlertContext.userSaveSuccess
            showAlert = true
        } catch {
            self.alertItem = AlertContext.invalidUserData
            showAlert = true
        }
    }
    
    func retieveUser() {
        guard let userData else { return }

        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            self.alertItem = AlertContext.invalidUserData
            showAlert = true
        }
    }
}
