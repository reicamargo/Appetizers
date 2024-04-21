//
//  EmptyState.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 21/04/24.
//

import SwiftUI

struct EmptyStateView: View {
    let imageName: ImageResource
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
            VStack {
                Image(.emptyOrder)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
            .offset(y: -50)
        }
    }
}

#Preview {
    EmptyStateView(imageName: .emptyOrder, message: "You have no items in your order.")
}
