//
//  OrderButtonView.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 20/04/24.
//

import SwiftUI

struct OrderButtonView: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .background(.brandPrimary.gradient)
            .foregroundStyle(.white)
            .cornerRadius(10)
    }
}

#Preview {
    OrderButtonView(title: "$11.49 - Add To Order")
}
