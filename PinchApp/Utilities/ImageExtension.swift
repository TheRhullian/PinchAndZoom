//
//  ImageExtension.swift
//  PinchApp
//
//  Created by Rhullian Damião on 02/03/22.
//

import SwiftUI

extension Image {
    // Pages
    static var backCoverPage: Image {
        Image("magazine-back-cover")
    }
    
    static var frontCoverPage: Image {
        Image("magazine-front-cover")
    }
    
    // Thumbnails
    static var thumbBackCoverPage: Image {
        Image("thumb-magazine-back-cover")
    }
    
    static var thumbFrontCoverPage: Image {
        Image("thumb-magazine-front-cover")
    }
}
