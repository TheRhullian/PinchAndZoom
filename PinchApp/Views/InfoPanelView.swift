//
//  InfoPanel.swift
//  PinchApp
//
//  Created by Rhullian Damião on 02/03/22.
//

import SwiftUI

struct InfoPanelView: View {
    var scale: CGFloat
    var offSet: CGSize
    
    @State private var isInfoPanelVisible: Bool = false
    
    var body: some View {
        HStack {
            Image.systemCircleCircle
                .symbolConfiguration()
                .onLongPressGesture(minimumDuration: 1) {
                    withAnimation(.spring()) {
                        isInfoPanelVisible.toggle()
                    }
                }
            Spacer()
            
            HStack(spacing: 2) {
                // SCALE
                Image.systemArrowUpLeftAndDownRight
                Text("\(scale)")
                
                Spacer()
                
                Image.systemArrowLeftRight
                Text("\(offSet.width)")
                
                Spacer()
                
                Image.systemArrowUpDown
                Text("\(offSet.height)")
                
                Spacer()
            }//: HSTACK
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            .frame(maxWidth: 420)
            .opacity(isInfoPanelVisible ? 1 : 0)
            
        }//: HSTACK
    }
}

struct InfoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPanelView(scale: 1, offSet: .zero)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
