//
//  Capital.swift
//  Wh
//
//  Created by Jirong Wang on 10/12/15.
//  Copyright © 2015 Jirong Wang. All rights reserved.
//

import Foundation

class Capital {
    
    var race: RACE
    var kingdomField: CapitalField
    var questField: CapitalField
    var battleField: CapitalField
    var cardPile = [String]()
    var discardPile = [String]()
    var loyalty = [RACE: Int]()
    
    init(race: RACE) {
        self.race = race
        self.kingdomField = CapitalField(name: "kingdom")
        self.questField = CapitalField(name: "quest")
        self.battleField = CapitalField (name: "battle")
        
        setupRace()
    }
    
    func setupRace() {
        for r in RACE.all() {
            self.loyalty[r] = 0
        }
        self.loyalty[self.race] = 1
    }
    
    func isBurn() -> Bool {
        return ((kingdomField.isBurn ? 1 : 0) +
            (questField.isBurn ? 1 : 0) +
            (battleField.isBurn ? 1 : 0)) >= 2
    }
    
    
}
