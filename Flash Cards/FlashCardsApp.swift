//
//  FlashCardsApp.swift
//  Flash Cards
//
//  Created by David Solis on 3/14/24.
//

import SwiftUI
import SwiftData

@main
struct FlashCardsApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([Card.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    do {
                        if try sharedModelContainer.mainContext.fetch(FetchDescriptor<Card>()).isEmpty {
                            Example.contents.forEach { sharedModelContainer.mainContext.insert($0) }
                        }
                    } catch {
                        fatalError("Failed to load cards")
                    }
                }
        }
        .modelContainer(sharedModelContainer)
    }
}
