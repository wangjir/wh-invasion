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
    var originHP: Int
    var originCost: Int
    var originPower: Int
    var skills = [String]()
    
    init(cardId: String, originCost: Int, originHP: Int, originPower: Int, skills: [String]) {
        self.id = cardId
        self.originCost = originCost
        self.originHP = originHP
        self.originPower = originPower
        self.skills = skills
    }
    
    
}