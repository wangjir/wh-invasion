//
//  WhGame.swift
//  Wh
//
//  Created by Jirong Wang on 10/12/15.
//  Copyright © 2015 Jirong Wang. All rights reserved.
//

import Foundation

class WhGame {
    
    var uuid: String
    var battleground: Battleground?

    
    init() {
        self.uuid = NSUUID().UUIDString
        
    }
    
    func initGame() {
        let ca = Capital(race: RACE.EMPIRE)
        let cb = Capital(race: RACE.ORC)
        
        let p1_uuid = NSUUID().UUIDString
        let p2_uuid = NSUUID().UUIDString
        
        let p1 = Player(uuid: p1_uuid, name: "player1", capital: ca)
        let p2 = Player(uuid: p2_uuid, name: "player2", capital: cb)
        
        self.battleground = Battleground(players: [p1, p2])
    }
    
}