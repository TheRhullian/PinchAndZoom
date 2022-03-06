//
//  PageModel.swift
//  PinchApp
//
//  Created by Rhullian Damião on 06/03/22.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnail: String {
        return "thumb-" + imageName
    }
}
