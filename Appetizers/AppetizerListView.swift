//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 19/04/24.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var appetizerListViewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack {
                List(appetizerListViewModel.appetizers, id:\.id) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }
                .navigationTitle("🍕 Appetizers")
                .navigationDestination(for: Appetizer.self) { appetizer in
                    
                }
            }
            .onAppear {
                appetizerListViewModel.getAppetizers()
            }
            if appetizerListViewModel.isLoading {
                LoadingView()
            }
        }
        .alert("Error",
               isPresented: $appetizerListViewModel.showAlert,
               presenting: appetizerListViewModel.alertItem,
               actions: { reason in
                    Button("OK", role: .cancel) { }
                },
                message: { reason in
                    reason.message
                })
    }
}

#Preview {
    AppetizerListView()
}
