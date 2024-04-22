//
//  LoadingView.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 19/04/24.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            ProgressView("Loading...")
                .controlSize(.large)
                .tint(.brandPrimary)
        }
    }
}

#Preview {
    LoadingView()
}
