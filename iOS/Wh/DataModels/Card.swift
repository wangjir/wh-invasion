//
//  UserCard.swift
//  Wh
//
//  Created by Jirong Wang on 10/12/15.
//  Copyright © 2015 Jirong Wang. All rights reserved.
//

import Foundation

class Card {
    
    var uuid: String
    var id: String
    var damage: Int = 0
    var currentHP: Int
    var currentPower: Int
    var cardTemplate: CardTemplate
    
    init(uuid: String, cardTemplate: CardTemplate) {
        self.uuid = uuid
        self.cardTemplate = cardTemplate
        self.id = cardTemplate.id
        self.currentHP = cardTemplate.originHP
        self.currentPower = cardTemplate.originPower
    }
    
    
    
}