//
//  Example.swift
//  Flash Cards
//
//  Created by David Solis on 3/14/24.
//

import SwiftData

@MainActor
struct Example {
    static let contents: [Card] = [Card(front: "2 x 2", back: "4"), Card(front: "2 x 3", back: "6"), Card(front: "2 x 4", back: "8"), Card(front: "2 x 5", back: "10"), Card(front: "2 x 6", back: "12"), Card(front: "2 x 7", back: "14"), Card(front: "2 x 8", back: "16"), Card(front: "2 x 9", back: "18"), Card(front: "3 x 3", back: "9"), Card(front: "3 x 4", back: "12"), Card(front: "3 x 5", back: "15"), Card(front: "3 x 6", back: "18"), Card(front: "3 x 7", back: "21"), Card(front: "3 x 8", back: "24"), Card(front: "3 x 9", back: "27"), Card(front: "4 x 4", back: "16"), Card(front: "4 x 5", back: "20"), Card(front: "4 x 6", back: "24"), Card(front: "4 x 7", back: "28"), Card(front: "4 x 8", back: "32"), Card(front: "4 x 9", back: "36"), Card(front: "5 x 5", back: "25"), Card(front: "5 x 6", back: "30"), Card(front: "5 x 7", back: "35"), Card(front: "5 x 8", back: "40"), Card(front: "5 x 9", back: "45"), Card(front: "6 x 6", back: "36"), Card(front: "6 x 7", back: "42"), Card(front: "6 x 8", back: "48"), Card(front: "6 x 9", back: "54"), Card(front: "7 x 7", back: "49"), Card(front: "7 x 8", back: "56"), Card(front: "7 x 9", back: "63"), Card(front: "8 x 8", back: "64"), Card(front: "8 x 9", back: "72"), Card(front: "9 x 9", back: "81")
    ]
    let container: ModelContainer
    
    init() {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            container = try ModelContainer(for: Card.self, configurations: config)
            if try container.mainContext.fetch(FetchDescriptor<Card>()).isEmpty {
                Example.contents.forEach { container.mainContext.insert($0) }
            }
        } catch {
            fatalError("Failed to create container")
        }
    }
}
