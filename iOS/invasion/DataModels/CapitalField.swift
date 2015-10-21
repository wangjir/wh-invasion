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
    var developments = [Card]()
    var cards = [Card]()
    var damage: Int = 0
    
    init(name: String) {
        assert(["quest", "kingdom", "battle"].indexOf(name) >= 0)
        self.fieldName = name
        originPower = (name == "kingdom") ? 3 : ((name == "quest") ? 1 : 0)
    }
    
    func addCard(card: Card) {
        cards.append(card)
    }
    
    func addDevelopment(card: Card) {
        developments.append(card)
    }
    
    func currentPower() -> Int {
        return originPower + cards.reduce(0) { $0 + $1.currentPower }
    }
    
    func maxHP() -> Int {
        return originHP + developments.count
    }
    
    func currentHP() -> Int {
        return originHP + developments.count - damage
    }
    
    func isBurn() -> Bool {
        return self.currentHP() <= 0
    }
    
}