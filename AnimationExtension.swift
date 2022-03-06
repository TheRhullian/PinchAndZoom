//
//  AnimationExtension.swift
//  PinchApp
//
//  Created by Rhullian Damião on 06/03/22.
//

import Foundation
import SwiftUI

extension Animation {
    static var springStandard: Animation {
        return .spring(response: 0.8, dampingFraction: 0.7, blendDuration: 1)
    }
}
