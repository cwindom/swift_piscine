//
//  JsonInfo.swift
//  ex00
//
//  Created by OUT-Korogodova-MM on 25.09.2021.
//

import Foundation

struct JSONInfo: Codable {
    let statuses: [Status]?
    
    struct Status: Codable {
        let text: String?
        let user: User?
        
        struct User: Codable {
            let screen_name: String?
        }
    }
}
