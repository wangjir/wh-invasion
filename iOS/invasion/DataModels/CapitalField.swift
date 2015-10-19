//
//  CapitalField.swift
//  Wh
//
//  Created by Jirong Wang on 10/12/15.
//  Copyright © 2015 Jirong Wang. All rights reserved.
//

import Foundation

class CapitalField {
    
    var fieldName: String
    
    var originHP: Int = 8
    var originPower: Int
    var development = [Card]()
    var cards = [Card]()
    var currentHP: Int = 8
    var isBurn: Bool = false
    
    init(name: String) {
        assert(["quest", "kingdom", "battle"].indexOf(name) >= 0)
        self.fieldName = name
        originPower = (name == "kingdom") ? 3 : 1
    }
    
    func addCard(card: Card) {
        cards.append(card)
    }
    
    func currentPower() -> Int {
        return originPower + cards.reduce(0) { $0 + $1.currentPower }
    }
    
}