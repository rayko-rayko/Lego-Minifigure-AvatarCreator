//
//  ImageHead.swift
//  Lego-Minifigure-AvatarCreator
//
//  Created by Koray Günseven on 11.12.2023.
//

import Foundation

enum ImageHead: String, CaseIterable, Identifiable {
    case smile = "head-0"
    case smileWithEyebrow = "head-1"
    case happy = "head-2"
    case sad = "head-3"
    case verySad = "head-4"
    case shocked = "head-5"

    var id: ImageHead { self }
}
