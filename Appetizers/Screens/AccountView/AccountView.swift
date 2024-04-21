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
                    TextField("First Name", text: $accountViewModel.user.firstName)
                    TextField("Last Name", text: $accountViewModel.user.lastName)
                    TextField("E-mail", text: $accountViewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        
                    DatePicker("Birthday",
                               selection: $accountViewModel.user.birthdate,
                               displayedComponents: [.date])
                    
                    Button {
                        accountViewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                            .foregroundStyle(.brandPrimary)
                    }
                    
                }
                Section("Requests") {
                    Toggle("Extra Napkins", isOn: $accountViewModel.user.extraNapkins)
                        .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                    Toggle("Frequent Refills", isOn: $accountViewModel.user.frequentRefills)
                        .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                }
            }
            .navigationTitle("👽 Account")
        }
        .onAppear {
            accountViewModel.retieveUser()
        }
        .alert("Message",
               isPresented: $accountViewModel.showAlert,
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
        .environmentObject(Order())
}
