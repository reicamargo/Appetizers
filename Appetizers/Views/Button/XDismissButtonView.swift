//
//  XDismissButtonView.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 20/04/24.
//

import SwiftUI

struct XDismissButtonView: View {
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

#Preview {
    XDismissButtonView()
}
