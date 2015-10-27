//
//  CardView.swift
//  Wh
//
//  Created by Jirong Wang on 10/16/15.
//  Copyright © 2015 Jirong Wang. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    // below is unchangeable
    @IBOutlet weak var cardName: UILabel!
    @IBOutlet weak var cardType: UILabel!
    @IBOutlet weak var cardCost: UILabel!
    @IBOutlet weak var cardDescription: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    
    // below is changeable value
    @IBOutlet weak var power: UILabel!
    @IBOutlet weak var hp: UILabel!
    
    var card : Card?
    
    func setupCard(card: Card) {
        self.card = card
        
        self.cardName.text = card.cardTemplate.name
        self.cardType.text = card.cardTemplate.type.simpleDescription()
        self.cardCost.text = "Cost: \(card.cardTemplate.originCost)"
        self.cardDescription.text = ""
        self.cardImage.image = UIImage(named: card.cardTemplate.imageName)
        
        self.power.text = "Power: \(card.currentPower)"
        self.hp.text = "HP: \(card.currentHP)"
    }
}
