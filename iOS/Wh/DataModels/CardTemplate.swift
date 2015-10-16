//
//  CardTemplate.swift
//  Wh
//
//  Created by Jirong Wang on 10/12/15.
//  Copyright © 2015 Jirong Wang. All rights reserved.
//

import Foundation

class CardTemplate {
    
    var id: String
    var set: String
    var type: CARD_TYPE
    var originHP: Int
    var originCost: Int
    var originPower: Int
    var imageName: String
    var name: String
    var loyaltyNeed = [RACE : Int]()
    var loyaltyProduce = [RACE: Int]()
    var skills = [String]()
    
    init(cardId: String,
        cardSet: String,
        cardType: CARD_TYPE,
        imageName: String,
        name: String,
        cost: Int,
        hp: Int,
        power: Int,
        loyaltyNeed: [String : Int],
        loyaltyProduce: [String: Int],
        skills: [String])
    {
        self.id = cardId
        self.set = cardSet
        self.type = cardType
        self.imageName = imageName
        self.name = name
    
        self.originCost = cost
        self.originHP = hp
        self.originPower = power
        
        for (s, v) in loyaltyNeed {
            self.loyaltyNeed[RACE.stringToRace(s)] = v
        }
        for (s, v) in loyaltyProduce {
            self.loyaltyProduce[RACE.stringToRace(s)] = v
        }
        
        self.skills = skills
    }
    
}