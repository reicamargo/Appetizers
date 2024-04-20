//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 19/04/24.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var appetizerListViewModel = AppetizerListViewModel()
    @State private var isShowingDetail = false
    @State private var selectedAppetizer: Appetizer?
    
    var body: some View {
        ZStack {
            NavigationView {
                List(appetizerListViewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            selectedAppetizer = appetizer
                            isShowingDetail = true
                        }
                }
                .navigationTitle("🍕 Appetizers")
            }
            .onAppear {
                appetizerListViewModel.getAppetizers()
            }
            .blur(radius: isShowingDetail ? 20 : 0)
            .disabled(isShowingDetail)
            
            if isShowingDetail {
                AppetizerDetailView(appetizer: selectedAppetizer!, isShowingDetail: $isShowingDetail)
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
