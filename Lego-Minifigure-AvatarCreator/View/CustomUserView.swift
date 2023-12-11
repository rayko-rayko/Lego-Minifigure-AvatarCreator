//
//  CustomUserView.swift
//  Lego-Minifigure-AvatarCreator
//
//  Created by Koray Günseven on 11.12.2023.
//

import SwiftUI

struct CustomUserView: View {
    // Kafa, vücut ve bacak görüntülerini tutan bağlı özellikler
    @Binding var headImage: ImageHead?
    @Binding var bodyImage: ImageBody?
    @Binding var legImage: ImageLeg?

    var body: some View {
        // Eğer kafa, vücut ve bacak görüntüleri seçilmişse
        if let headImage = headImage, let bodyImage = bodyImage, let legImage = legImage {
            // Seçilen görüntüleri içeren özel bir dikey düzen
            VStack {
                // Kafa görüntüsü
                CustomImageView(imagePath: headImage.rawValue)
                    .frame(width: 200, height: 200)
                // Vücut görüntüsü
                CustomImageView(imagePath: bodyImage.rawValue)
                    .frame(width: 400, height: 200)
                    .offset(y: -9)
                // Bacak görüntüsü
                CustomImageView(imagePath: legImage.rawValue)
                    .frame(width: 400, height: 200)
                    .offset(y: -77)
            }
        } else {
            // Eğer tüm kıyafetler seçilmemişse
            Text("Please choose all clothes")
                .font(.title)
                .bold()
                .foregroundStyle(.red)
        }
    }
}

#Preview {
    // Önizleme için örnek kullanıcı görünümü
    CustomUserView(
        headImage: .constant(.happy),
        bodyImage: .constant(.black),
        legImage: .constant(.black))
}
