//
//  ImageLeg.swift
//  Lego-Minifigure-AvatarCreator
//
//  Created by Koray Günseven on 11.12.2023.
//

import Foundation

enum ImageLeg: String, CaseIterable, Identifiable {
    case blue = "leg-0"
    case grey = "leg-1"
    case black = "leg-2"

    var id: ImageLeg { self }
}
