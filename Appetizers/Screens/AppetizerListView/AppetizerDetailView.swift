//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 20/04/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    var appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
            }
            HStack(spacing: 40) {
                NutriotionalValuesView(title: "Calories", value: String(appetizer.calories))
                NutriotionalValuesView(title: "Carbs", value: String(format: "%i g", appetizer.carbs))
                NutriotionalValuesView(title: "Protein", value: String(format: "%i g", appetizer.protein))
            }
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                OrderButtonView(title: String(format: "$%.2f - Add To Order", appetizer.price))
            })
            .padding()
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(
            Button {
                isShowingDetail = false
            } label: {
                XCloseButtonView()
            },
            alignment: .topTrailing)
            
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
}

struct NutriotionalValuesView: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .fontWeight(.bold)
                .font(.caption)
            Text(value)
                .fontWeight(.semibold)
                .italic()
                .foregroundStyle(.secondary)
        }
    }
}

struct XCloseButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundStyle(.black)
        }
    }
}
