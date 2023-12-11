//
//  CustomImageView.swift
//  Lego-Minifigure-AvatarCreator
//
//  Created by Koray Günseven on 11.12.2023.
//

import SwiftUI

struct CustomImageView: View {
    // Görüntünün dosya yolunu tutan sabit
    let imagePath: String

    var body: some View {
        // Özel görüntü görüntüleyici
        Image(imagePath)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipped()
    }
}

#Preview {
    // Görüntüyü önizlemek için örnek kullanım
    CustomImageView(imagePath: "head0")
}
