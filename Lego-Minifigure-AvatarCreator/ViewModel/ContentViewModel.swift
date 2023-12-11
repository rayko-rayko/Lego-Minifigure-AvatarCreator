//
//  ContentViewModel.swift
//  Lego-Minifigure-AvatarCreator
//
//  Created by Koray Günseven on 11.12.2023.
//

import Foundation

final class ContentViewModel: ObservableObject {
    // Özel kullanıcı görünümünü göstermek için yayımlanan özellik
    @Published var showCustomUserView: Bool = false
    // Seçilen kafa, vücut ve bacak görüntülerini tutan yayımlanan özellikler
    @Published var selectedHead: ImageHead?
    @Published var selectedBody: ImageBody?
    @Published var selectedLeg: ImageLeg?

    // Tüm özellikleri temizleyen fonksiyon
    func clearProperties() {
        selectedHead = nil
        selectedBody = nil
        selectedLeg = nil
    }
}
