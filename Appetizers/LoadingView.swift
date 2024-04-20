//
//  LoadingView.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 19/04/24.
//

import SwiftUI

struct LoadingView: View {
    //let width: CGFloat
    //let height: CGFloat
    
    var body: some View {
        ProgressView()
            .controlSize(.large)
            .tint(.brandPrimary)
    }
}

#Preview {
    LoadingView()
}
