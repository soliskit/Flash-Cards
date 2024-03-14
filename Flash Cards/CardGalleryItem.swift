//
//  CardGalleryItem.swift
//  Flash Cards
//
//  Created by David Solis on 3/14/24.
//

import SwiftUI

struct CardGalleryItem<Content: View, S: ShapeStyle>: View {
    let backgroundStyle: S
    let action: () -> Void
    @ViewBuilder var label: Content
    
    var body: some View {
        Button(action: action) {
            CardContainerView {
                label
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .minimumScaleFactor(0.5)
                    .padding()
            }
        }
        .backgroundStyle(backgroundStyle)
        .buttonStyle(.plain)
        .padding(0)
    }
}
