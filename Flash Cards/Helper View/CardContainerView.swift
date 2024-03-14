//
//  CardContainerView.swift
//  Flash Cards
//
//  Created by David Solis on 3/14/24.
//

import SwiftUI

struct CardContainerView<Content: View>: View {
    @ViewBuilder var content: Content
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.clear)
            content
                .foregroundStyle(Color.cardText)
        }
        .aspectRatio(2, contentMode: .fit)
        .background()
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}
