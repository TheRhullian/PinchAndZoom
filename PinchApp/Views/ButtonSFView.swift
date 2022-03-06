//
//  ButtonSFView.swift
//  PinchApp
//
//  Created by Rhullian Damião on 06/03/22.
//

import SwiftUI

struct ButtonSFView: View {
    let icon: Image
    let action: (()-> Void)
    
    var body: some View {
        Button(action: action,
               label: {
                icon
                    .font(.system(size: 36))
        })//: BUTTON
    }
}

struct ButtonSFView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSFView(icon: Image.systemPlusMagnifyingGlass, action: {})
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
