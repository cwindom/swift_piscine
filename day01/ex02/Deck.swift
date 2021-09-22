//
//  Deck.swift
//  ex02
//
//  Created by OUT-Korogodova-MM on 22.09.2021.
//

import Foundation

class Deck: NSObject {
    
    static let allSpades = Value.allValues.map({Card(color: Color.spades, value: $0)})
    static let allDiamonds = Value.allValues.map({Card(color: Color.diamonds, value: $0)})
    static let allHearts = Value.allValues.map({Card(color: Color.hearts, value: $0)})
    static let allClubs = Value.allValues.map({Card(color: Color.clubs, value: $0)})
    
    static let allCards = allSpades + allDiamonds + allHearts + allClubs
}
