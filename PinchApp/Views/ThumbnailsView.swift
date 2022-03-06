//
//  ThumbnailsView.swift
//  PinchApp
//
//  Created by Rhullian Damião on 06/03/22.
//

import SwiftUI

struct ThumbnailsView: View {
    
    @Binding var isDrawerOpen: Bool
    
    var body: some View {
        HStack(spacing: 12) {
            (isDrawerOpen ? Image.systemChevronRight : Image.systemChevronLeft)
                .resizable()
                .scaledToFit()
                .frame(height: 40)
                .padding(8)
                .foregroundStyle(.secondary)
                .onTapGesture {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 1)) {
                        isDrawerOpen.toggle()
                    }
                }
            Spacer()
        }
        .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
        .background(.ultraThinMaterial)
        .cornerRadius(12)
    }
}

struct ThumbnailsView_Previews: PreviewProvider {
    static var previews: some View {
        ThumbnailsView(isDrawerOpen: .constant(false))
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
            .padding()
    }
}
