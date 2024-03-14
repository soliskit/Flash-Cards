//
//  Card.swift
//  Flash Cards
//
//  Created by David Solis on 3/14/24.
//

import Foundation
import SwiftData

@Model
class Card {
    let id = UUID()
    let front: String
    let back: String
    let creationDate: Date
    
    init(front: String, back: String, creationDate: Date = .now) {
        self.front = front
        self.back = back
        self.creationDate = creationDate
    }
}
