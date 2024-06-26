//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 20/04/24.
//

import SwiftUI

struct RemoteImageView: View {
    var image: Image?
    var imagePlaceHolder: ImageResource
    
    var body: some View {
        image?.resizable() ?? Image(imagePlaceHolder).resizable()
    }
}

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage else { return }
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}
