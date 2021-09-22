//
//  main.swift
//  ex00
//
//  Created by OUT-Korogodova-MM on 22.09.2021.
//

import Foundation

var deck = Deck(sorted: true)
var card: Card?

//print(deck)

card = deck.draw()
card = deck.draw()
card = deck.draw()

card = nil

for i in deck.outs {
        print("outs: \(i)")
}

deck.fold(c: deck.outs[0])
deck.fold(c: deck.outs[1])

for i in deck.discards {
        print("discards: \(i)")
}

for i in deck.outs {
        print("outs: \(i)")
}

//for i in deck.cards {
//      print(i)
//}
