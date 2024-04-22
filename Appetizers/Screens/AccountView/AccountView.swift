//
//  AppetizerView.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 19/04/24.
//

import SwiftUI

struct AccountView: View {
    @StateObject var accountViewModel = AccountViewModel()
    
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("Personal Info") {
                    TextField("First Name", text: $accountViewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit {
                            focusedTextField = .lastName
                        }
                        .submitLabel(.next)
                    TextField("Last Name", text: $accountViewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit {
                            focusedTextField = .email
                        }
                        .submitLabel(.next)
                    TextField("E-mail", text: $accountViewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit {
                            focusedTextField = nil
                        }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        
                    DatePicker("Birthday",
                               selection: $accountViewModel.user.birthdate,
                               in: Date().oneHundredTenYearsAgor...Date().eighteenYearsAgo,
                               displayedComponents: .date)
                    
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
//            .toolbar {
//                ToolbarItemGroup(placement: .keyboard) {
//                    Button("Dismiss") {
//                        focusedTextField = nil
//                    }
//                }
//                    
//            }
        }
        .onAppear {
            accountViewModel.retieveUser()
        }
        .alert(accountViewModel.alertItem?.title ?? "Message",
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
