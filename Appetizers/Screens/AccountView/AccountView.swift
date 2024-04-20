//
//  AppetizerView.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 19/04/24.
//

import SwiftUI

struct AccountView: View {
    @StateObject var accountViewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section("Personal Info") {
                    TextField("First Name", text: $accountViewModel.firstName)
                    TextField("Last Name", text: $accountViewModel.lastName)
                    TextField("E-mail", text: $accountViewModel.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        
                    DatePicker("Birthday",
                               selection: $accountViewModel.birthdate,
                               displayedComponents: .date)
                    
                    Button {
                        accountViewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                            .foregroundStyle(.brandPrimary)
                    }
                    
                }
                Section("Requests") {
                    Toggle("Extra Napkins", isOn: $accountViewModel.extraNapkins)
                    Toggle("Frequent Refills", isOn: $accountViewModel.frequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            .navigationTitle("👽 Account")
        }
        .alert("Form Error",
               isPresented: $accountViewModel.showErrorAlert,
               presenting: accountViewModel.alertItem,
               actions: { reason in
                    Button("OK", role: .cancel) { }
                },
                message: { reason in
                    reason.message
                })
    }
}

#Preview {
    AccountView()
}
