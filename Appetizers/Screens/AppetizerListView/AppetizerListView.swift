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
            NavigationView {
                List(appetizerListViewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .listRowSeparator(.visible)
                    //.listRowSeparatorTint(.red)
                        .onTapGesture {
                            appetizerListViewModel.selectedAppetizer = appetizer
                            appetizerListViewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("🍕 Appetizers")
            }
            .task {
                //specific for calling network services on appear. If the user leave the view and the call didn't finished, task will cancel automatically the call
                appetizerListViewModel.getAppetizers()
            }
//            .onAppear {
//            async old way
//                appetizerListViewModel.getAppetizers()
//            }
            .blur(radius: appetizerListViewModel.isShowingDetail ? 20 : 0)
            .disabled(appetizerListViewModel.isShowingDetail)
            
            if appetizerListViewModel.isShowingDetail {
                AppetizerDetailView(appetizer: appetizerListViewModel.selectedAppetizer!, isShowingDetail: $appetizerListViewModel.isShowingDetail)
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
        .environmentObject(Order())
}
