//
//  APITwitterDelegateProtocol.swift
//  ex00
//
//  Created by OUT-Korogodova-MM on 25.09.2021.
//

import Foundation

protocol APITwitterDelegate: AnyObject {
    
    func manageTweets(_ tweets: [Tweet])
    func manageError(_: NSError)
}
