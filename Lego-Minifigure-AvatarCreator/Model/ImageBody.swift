//
//  ImageBody.swift
//  Lego-Minifigure-AvatarCreator
//
//  Created by Koray Günseven on 11.12.2023.
//

import Foundation

enum ImageBody: String, CaseIterable, Identifiable {
    case black = "body-0"
    case brown = "body-1"
    case red = "body-2"

    var id: ImageBody { self }
}
