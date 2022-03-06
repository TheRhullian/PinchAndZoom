//
//  ControlPanelView.swift
//  PinchApp
//
//  Created by Rhullian Damião on 06/03/22.
//

import SwiftUI

struct ImageControlPanelView: View {
    var minusAction: (() -> Void)
    var plusAction: (() -> Void)
    var resizeAction: (() -> Void)
    
    var body: some View {
        HStack {
            ButtonSFView(icon: .systemMinusMagnifyingGlass, action: minusAction)
            
            ButtonSFView(icon: .systemArrowUpDownMagnifyingGlass, action: resizeAction)
            
            ButtonSFView(icon: .systemPlusMagnifyingGlass, action: plusAction)
        }
        .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
        .background(.ultraThinMaterial)
        .cornerRadius(12)
    }
}

struct ControlPanelView_Previews: PreviewProvider {
    static var previews: some View {
        ImageControlPanelView(minusAction: {}, plusAction: {}, resizeAction: {})
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
