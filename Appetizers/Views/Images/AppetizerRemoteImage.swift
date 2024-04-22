//
//  AppertizerRemoteImage.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 20/04/24.
//

import SwiftUI

struct AppetizerRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String

    
    var body: some View {
        RemoteImageView(image: imageLoader.image, imagePlaceHolder: .foodPlaceholder)
            .onAppear {
                imageLoader.load(fromURLString: urlString)
            }
        
    }
}

#Preview {
    AppetizerRemoteImage(urlString: "")
}
