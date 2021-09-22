//
//  main.swift
//  ex00
//
//  Created by OUT-Korogodova-MM on 22.09.2021.
//

import Foundation

var card1 = Card(color: Color.diamonds, value: Value.four)
print(card1.description)

var card2 = Card(color: Color.hearts, value: Value.queen)
print (card2.description)

print(card1 == card2)

var card3 = Card(color: Color.diamonds, value: Value.four)

print(card1 == card3)
