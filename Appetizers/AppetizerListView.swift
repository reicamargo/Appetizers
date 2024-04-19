//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 19/04/24.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationStack {
            List(MockData.appetizers, id:\.id) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🍕 Appetizers")
            .navigationDestination(for: Appetizer.self) { appetizer in
                
            }
        }
    }
}

#Preview {
    AppetizerListView()
}
