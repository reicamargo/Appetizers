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
        
        HStack(alignment: .top) {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                    .frame(width: 120, height: 90)
            
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

// With async image. But, it doesn't have cache
//AsyncImage(url: url) { image in
//    image
//        .resizable()
//        .aspectRatio(contentMode: .fit)
//        .cornerRadius(8)
//} placeholder: {
//    Image(imagePlaceHolder).resizable()
//}
//.frame(width: 120, height: 90)
