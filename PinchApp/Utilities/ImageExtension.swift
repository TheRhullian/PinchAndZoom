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
    
    // System Symbols
    static var systemCircleCircle: Image {
        Image(systemName: "circle.circle")
    }
    
    static var systemArrowUpLeftAndDownRight: Image {
        Image(systemName: "arrow.up.left.and.arrow.down.right")
    }
    
    static var systemArrowLeftRight: Image {
        Image(systemName: "arrow.left.and.right")
    }
    
    static var systemArrowUpDown: Image {
        Image(systemName: "arrow.up.and.down")
    }
    
    static var systemMinusMagnifyingGlass: Image {
        Image(systemName: "minus.magnifyingglass")
    }
    
    static var systemPlusMagnifyingGlass: Image {
        Image(systemName: "plus.magnifyingglass")
    }
    
    static var systemArrowUpDownMagnifyingGlass: Image {
        Image(systemName: "arrow.up.left.and.down.right.magnifyingglass")
    }
    
    static var systemChevronLeft: Image {
        Image(systemName: "chevron.compact.left")
    }
    
    static var systemChevronRight: Image {
        Image(systemName: "chevron.compact.right")
    }
    
    // METHODS
    func symbolConfiguration() -> some View {
        self
            .symbolRenderingMode(.hierarchical)
            .resizable()
            .frame(width: 30, height: 30)
    }
    
    func pageConfiguration() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
            .padding()
            .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
    }
}
