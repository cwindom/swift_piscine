//
//  Card.swift
//  ex01
//
//  Created by OUT-Korogodova-MM on 22.09.2021.
//

import Foundation

class Card: NSObject {
    
    let color: Color
    let value: Value
    
    init(color: Color, value: Value) {
        
        self.color = color
        self.value = value
    }
    
    override var description: String {
        
        "This card is \(self.value) from \(self.color.rawValue)"
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        
        if let object = object as? Card {
            return (self.color == object.color && self.value == object.value)
        }
        return false
    }
}


