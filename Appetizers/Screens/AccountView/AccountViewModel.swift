//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 20/04/24.
//

import Foundation

class AccountViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthdate = Date()
    @Published var extraNapkins = false
    @Published var frequentRefills = false
    @Published var alertItem: AlertItem?
    @Published var showErrorAlert = false
    
    private var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            self.alertItem = AlertContext.emptyField
            showErrorAlert = true
            return false
        }
        
        guard email.isValidEmail else {
            self.alertItem = AlertContext.invalidEmail
            showErrorAlert = true
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        
        
    }
}
