//
//  Battleground.swift
//  Wh
//
//  Created by Jirong Wang on 10/12/15.
//  Copyright © 2015 Jirong Wang. All rights reserved.
//

import Foundation

class Battleground {
    
    var players = [Player]()
    var currentPlayer: Int = 0
    
    init(players: [Player]) {
        self.players = players
    }
    
}