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
    @Query private var items: [Card]

    var body: some View {
        Text("Hello")
    }
}

#Preview {
    ContentView()
        .modelContainer(Example().container)
}
