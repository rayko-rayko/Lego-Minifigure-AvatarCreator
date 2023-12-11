//
//  CustomUserView.swift
//  Lego-Minifigure-AvatarCreator
//
//  Created by Koray Günseven on 11.12.2023.
//

import SwiftUI

struct CustomUserView: View {
    @Binding var headImage: ImageHead?
    @Binding var bodyImage: ImageBody?
    @Binding var legImage: ImageLeg?

    var body: some View {
        if let headImage = headImage, let bodyImage = bodyImage, let legImage = legImage {
            VStack {
                CustomImageView(imagePath: headImage.rawValue)
                    .frame(width: 200, height: 200)
                CustomImageView(imagePath: bodyImage.rawValue)
                    .frame(width: 400, height: 200)
                    .offset(y: -9)
                CustomImageView(imagePath: legImage.rawValue)
                    .frame(width: 400, height: 200)
                    .offset(y: -77)
            }
        } else {
            Text("Please choose all clothes")
                .font(.title)
                .bold()
                .foregroundStyle(.red)
        }
    }
}

#Preview {
    CustomUserView(
        headImage: .constant(.happy),
        bodyImage: .constant(.black),
        legImage: .constant(.black))
}
