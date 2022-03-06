//
//  ContentView.swift
//  PinchApp
//
//  Created by Rhullian Damião on 02/03/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isAnimating: Bool = false
    @State private var isDrawerOpen: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.clear
                
                Image.frontCoverPage
                    .pageConfiguration()
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .scaleEffect(imageScale)
                    .onTapGesture(count: 2) {
                        switch imageScale {
                        case 1:
                            withAnimation(.spring()) {
                                imageScale = 5
                            }
                        default:
                            withAnimation(.spring()) {
                                resetImageState()
                            }
                        }
                    }
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                withAnimation(.linear(duration: 1)) {
                                    imageOffset = value.translation
                                }
                            })
                            .onEnded({ _ in
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                            })
                    )//: DRAG GESTURE
                    // MARK: - MAGNIFICATION GESTURE
                    .gesture(
                        MagnificationGesture()
                            .onChanged ({ value in
                                withAnimation(.linear(duration: 1)) {
                                    if value >= 1 && value <= 5 {
                                        imageScale = value
                                    }
                                }
                            })
                            .onEnded({ value in
                                if value >= 5 {
                                    imageScale = 5
                                } else if value <= 1 {
                                    resetImageState()
                                }
                            })
                    )//: MAGNIFICATION GESTURE
            }//: ZSTACK
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                isAnimating = true
            }
            // MARK: - INFO PANEL
            .overlay(
                InfoPanelView(scale: imageScale, offSet: imageOffset)
                    .padding(.horizontal)
                    .padding(.top, 30)
                , alignment: .top
            )//: INFO PANEL
            // MARK: - IMAGE CONTROL PANEL
            .overlay(
                ImageControlPanelView(minusAction: {
                    withAnimation(.spring()) {
                        if imageScale > 1 {
                            imageScale -= 1
                            
                            (imageScale <= 1) ? resetImageState() : ()
                        }
                    }
                }, plusAction: {
                    withAnimation(.spring()) {
                        if imageScale < 5 {
                            imageScale += 1
                            
                            imageScale = (imageScale > 5) ? 5 : imageScale
                        }
                    }
                }, resizeAction: {
                    resetImageState()
                })
                    .padding(.bottom, 30)
                    .opacity(isAnimating ? 1 : 0)
                , alignment: .bottom
            )//: IMAGE CONTROL OVERLAY
            // MARK: - THUMBNAILS
            .overlay(
                ThumbnailsView(isDrawerOpen: $isDrawerOpen)
                    .opacity(isAnimating ? 1 : 0)
                    .frame(width: 260)
                    .padding(.top, UIScreen.main.bounds.height/12)
                    .offset(x: isDrawerOpen ? 20 : 215)
                , alignment: .topTrailing
            )
        }//: NAVIGATION VIEW
        .navigationViewStyle(.stack)
    }
    
    // Function
    func resetImageState() {
        withAnimation(.spring()) {
            imageScale = 1
            imageOffset = .zero
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
