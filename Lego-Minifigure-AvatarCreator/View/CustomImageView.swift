//
//  CustomImageView.swift
//  Lego-Minifigure-AvatarCreator
//
//  Created by Koray Günseven on 11.12.2023.
//

import SwiftUI

struct CustomImageView: View {
    let imagePath: String

    var body: some View {
        Image(imagePath)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipped()
    }
}

#Preview {
    CustomImageView(imagePath: "head0")
}

