//
//  FlashCardView.swift
//  Flash Cards
//
//  Created by David Solis on 3/14/24.
//

import SwiftUI

struct FlashCardView: View {
    @State private var flipped = false
    var front: Angle {
        flipped ? .degrees(180) : .degrees(0)
    }
    var back: Angle {
        flipped ? .degrees(0) : .degrees(-180)
    }
    var card: Card
    
    var body: some View {
        Button {
            withAnimation {
                flipped.toggle()
            }
        } label: {
            VStack {
                ZStack {
                    CardReaderView(color: .cardFront, text: card.front)
                        .horizontalFlip(front, visible: !flipped)
                    CardReaderView(color: .cardBack, text: card.back, displaysCode: true)
                        .horizontalFlip(back, visible: flipped)
                }
            }
        }
        .buttonStyle(.plain)
        .focusEffectDisabled()
        .padding(.horizontal, 8)
    }
}

#Preview("Flash Card") {
    FlashCardView(card: Example.contents[0])
}
