//
//  CardGallery.swift
//  Flash Cards
//
//  Created by David Solis on 3/14/24.
//

import SwiftUI

struct CardGallery: View {
    var cards: [Card]
    let selectCard: (Card) -> Void
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 200))], spacing: 20) {
                ForEach(cards) { card in
                    CardGalleryItem(backgroundStyle: Color.cardFront) {
                        selectCard(card)
                    } label: {
                        Text(card.front)
                    }
                }
            }
        }
        .scrollClipDisabled()
        .navigationDestination(for: Card.self) { selectedCard in
            CardCarousel(cards: cards, selectedCard: selectedCard)
        }
    }
}

#Preview("Card Gallery") {
    CardGallery(cards: Example.contents) { _ in
        
    }
}
