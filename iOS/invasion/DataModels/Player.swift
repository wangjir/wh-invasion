//
//  Player.swift
//  Wh
//
//  Created by Jirong Wang on 10/12/15.
//  Copyright © 2015 Jirong Wang. All rights reserved.
//

import Foundation

class Player {
  
    var uuid: String
    var name: String
    var handCards = [Card]()
    var capital: Capital
    
    init(uuid: String, name: String, capital: Capital) {
        self.uuid = uuid
        self.name = name
        self.capital = capital
    }
    
    func addCard(card: Card) {
        handCards.append(card)
    }
}