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
    var handCards = [String: Card]()
    var capital: Capital
    
    init(uuid: String, name: String, capital: Capital) {
        self.uuid = uuid
        self.name = name
        self.capital = capital
    }
    
}