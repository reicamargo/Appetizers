//
//  OrderView.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 19/04/24.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.remove)
                    }
                    Button {
                        
                    } label: {
                        OrderButtonView(title: String(format: "$ %.2f - Place Order", order.totalPrice))
                    }
                    .padding()
                }
                if order.items.isEmpty {
                    EmptyStateView(imageName: .emptyOrder, message: "You have no items in your order. Please add an appetizer")
                }
            }
            .navigationTitle("🧾 Order")
        }
    }
}

#Preview {
    OrderView()
        .environmentObject(Order())
}
