//
//  ThumbnailsView.swift
//  PinchApp
//
//  Created by Rhullian Damião on 06/03/22.
//

import SwiftUI

struct ThumbnailsView: View {
    
    @Binding var isDrawerOpen: Bool
    @Binding var isAnimating: Bool
    @Binding var pageSelected: Int
    @Binding var thumbs: [Page]
    
    var body: some View {
        HStack(spacing: 12) {
            (isDrawerOpen ? Image.systemChevronRight : Image.systemChevronLeft)
                .resizable()
                .scaledToFit()
                .frame(height: 40)
                .padding(8)
                .foregroundStyle(.secondary)
                .onTapGesture {
                    withAnimation(.springStandard) {
                        isDrawerOpen.toggle()
                    }
                }
            
            //MARK: - SET THUMBNAILS
            ForEach(thumbs) { page in
                Image(page.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                    .opacity(isDrawerOpen ? 1 : 0)
                    .animation(.easeOut(duration: 0.5), value: isDrawerOpen)
                    .onTapGesture {
                        isAnimating = true
                        pageSelected = page.id
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
        ThumbnailsView(isDrawerOpen: .constant(true), isAnimating: .constant(false), pageSelected: .constant(0), thumbs: .constant(pagesData))
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
            .padding()
    }
}
