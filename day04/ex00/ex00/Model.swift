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
    let date: String
    
    init(name: String, text: String, date: String) {
        self.name = name
        self.text = text
        self.date = date
    }
}

extension Tweet: CustomStringConvertible {
    
    var description: String {
        
        name + " " + text
    }
}
