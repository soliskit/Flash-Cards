//
//  ContentView.swift
//  Flash Cards
//
//  Created by David Solis on 3/14/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var cards: [Card]
    @State private var navigationPath: [Card] = []

    var body: some View {
        NavigationStack(path: $navigationPath) {
            CardGallery(cards: cards) { card in
                withAnimation {
                    navigationPath.append(card)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(Example().container)
}
