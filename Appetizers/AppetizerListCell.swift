//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 19/04/24.
//

import SwiftUI

struct AppetizerListCell: View {
    var appetizer: Appetizer
    var body: some View {
        let url = URL(string: appetizer.imageURL)
        HStack(alignment: .top) {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .frame(width: 120, height: 90)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
            } placeholder: {
                ProgressView()
                    .tint(.blue)
                    .frame(width: 120, height: 90)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text(String(format: "$ %.2f", appetizer.price))
                    .foregroundStyle(.secondary)
                    .font(.system(size: 16, weight: .semibold, design: .default))
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
