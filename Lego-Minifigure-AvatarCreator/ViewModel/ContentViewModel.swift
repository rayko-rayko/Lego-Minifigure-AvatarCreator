//
//  ContentViewModel.swift
//  Lego-Minifigure-AvatarCreator
//
//  Created by Koray Günseven on 11.12.2023.
//

import Foundation

final class ContentViewModel: ObservableObject {
    @Published var showCustomUserView: Bool = false
    @Published var selectedHead: ImageHead?
    @Published var selectedBody: ImageBody?
    @Published var selectedLeg: ImageLeg?

    func clearProperties() {
        selectedHead = nil
        selectedBody = nil
        selectedHead = nil
    }
}
