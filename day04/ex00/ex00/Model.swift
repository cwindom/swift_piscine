//
//  Model.swift
//  ex00
//
//  Created by OUT-Korogodova-MM on 25.09.2021.
//

import Foundation

struct Tweet: Codable {
    
    let name: String
    let text: String
    
    init(name: String, text: String) {
        self.name = name
        self.text = text
    }
}

extension Tweet: CustomStringConvertible {
    
    var description: String {
        
        name + " " + text
    }
}
