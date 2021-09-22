//
//  Deck.swift
//  ex02
//
//  Created by OUT-Korogodova-MM on 22.09.2021.
//

import Foundation

class Deck: NSObject {
    
    var cards: [Card] = allCards
    var discards: [Card] = []
    var outs: [Card] = []
    
    static let allSpades = Value.allValues.map({Card(color: Color.spades, value: $0)})
    static let allDiamonds = Value.allValues.map({Card(color: Color.diamonds, value: $0)})
    static let allHearts = Value.allValues.map({Card(color: Color.hearts, value: $0)})
    static let allClubs = Value.allValues.map({Card(color: Color.clubs, value: $0)})
    
    static let allCards = allSpades + allDiamonds + allHearts + allClubs
    
    init(sorted: Bool) {
        self.cards = Deck.allCards
        if sorted {
            self.cards.mixing()
        }
    }
}

extension Deck {
    
    override public var description: String {
        
        self.cards.description
    }
    
    func draw() -> Card? {
        
        var first: Card?
        
        first = self.cards.first
        
        guard let first = first else {
            return nil
        }
        
        self.outs.append(first)
        self.cards.remove(at: 0)
        return first
    }
    
    func fold(c: Card) {
        
        var index = 0
        
        for i in self.outs {
            if c == i {
                self.discards.append(i)
                self.outs.remove(at: index)
            }
            index += 1
        }
    }
}

extension Array {
    
    mutating func mixing() {
        
        var index = 0
        for i in 0..<self.count {
            index = Int(arc4random_uniform(UInt32(self.count)))
            if i != index {
                self.swapAt(i, index)
            }
        }
    }
}
