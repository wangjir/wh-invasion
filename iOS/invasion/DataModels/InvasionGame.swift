//
//  InvasionGame.swift
//  Wh
//
//  Created by Jirong Wang on 10/12/15.
//  Copyright © 2015 Jirong Wang. All rights reserved.
//

import Foundation

class InvasionGame {
    
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
        
        let cm = CardManager()
        cm.loadCardFromJson()
        
        let c1 = Card(uuid: NSUUID().UUIDString, cardTemplate: cm.cardTemplates[0])
        let c2 = Card(uuid: NSUUID().UUIDString, cardTemplate: cm.cardTemplates[1])
        let c3 = Card(uuid: NSUUID().UUIDString, cardTemplate: cm.cardTemplates[2])
        p1.addCard(c1)
        p1.addCard(c1)
        p1.addCard(c2)
        p1.addCard(c2)
        p1.addCard(c2)
        p1.addCard(c2)
        p1.addCard(c2)
        p1.addCard(c2)
        
        p2.addCard(c2)
        /*
        p1.capital.kingdomField.addCard(c1)
        p1.capital.kingdomField.addCard(c1)
        p1.capital.kingdomField.addCard(c2)
        //p1.capital.kingdomField.addCard(c1)
        //p1.capital.kingdomField.addCard(c2)
        
        p2.capital.kingdomField.addCard(c2)
        p2.capital.kingdomField.addCard(c3)
        p2.capital.kingdomField.addCard(c3)
        p2.capital.kingdomField.addCard(c2)
        p2.capital.kingdomField.addCard(c3)
        
        p1.capital.questField.addCard(c2)
        p1.capital.questField.addCard(c2)
        p1.capital.questField.addCard(c3)
        
        p2.capital.questField.addCard(c1)
        p2.capital.questField.addCard(c2)
        
        p1.capital.battleField.addCard(c1)
        //p1.capital.battleField.addCard(c2)
        //p1.capital.battleField.addCard(c3)
        //p1.capital.battleField.addCard(c2)
*/
    }
    
}