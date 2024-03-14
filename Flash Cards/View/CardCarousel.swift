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
                        .focused($focusCardID, equals: card.id)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollPosition(id: $selectedCardID)
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.paging)
            
            Text("Swipe left/right to review other cards")
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                .font(.footnote)
        }
        .background()
        .onAppear {
            selectedCardID = initialCardID
        }
        .onChange(of: selectedCardID) {
            focusCardID = $1
        }
    }
}

#Preview("Card Carousel") {
    CardCarousel(cards: Example.contents, selectedCard: Example.contents[0])
}
