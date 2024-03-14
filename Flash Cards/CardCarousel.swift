//
//  CardCarousel.swift
//  Flash Cards
//
//  Created by David Solis on 3/14/24.
//

import SwiftUI
import SwiftData

struct CardCarousel: View {
    @State private var selectedCardID: PersistentIdentifier?
    @FocusState private var focusCardID: PersistentIdentifier?
    private let initialCardID: PersistentIdentifier
    
    var cards: [Card]
    
    init(cards: [Card], selectedCard: Card) {
        self.cards = cards
        initialCardID = selectedCard.id
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(cards) { card in
                        Group {
                            FlashCardView(card: card)
                                .id(card.id)
                        }
                        .containerRelativeFrame(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    CardCarousel(cards: Example.contents, selectedCard: Example.contents[0])
}