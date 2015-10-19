//
//  CardManager.swift
//  Wh
//
//  Created by Jirong Wang on 10/16/15.
//  Copyright © 2015 Jirong Wang. All rights reserved.
//

import Foundation

class CardManager {
    
    var cardTemplates = [CardTemplate]()
    
    func loadCardFromJson() {
        cardTemplates.removeAll()
        if let path = NSBundle.mainBundle().pathForResource("cards", ofType: "json") {
            do {
                let data = try NSData(contentsOfURL: NSURL(fileURLWithPath: path), options: NSDataReadingOptions.DataReadingMappedIfSafe)
                if let jsonData: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                    for (cardId, cardData) in jsonData {
                        self.loadOneCard(cardId, cardData: cardData)
                    }
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        } else {
            print("Invalid filename/path.")
        }
    }
    
    func loadOneCard(cardId : AnyObject, cardData : AnyObject) {
        if !(cardId is String) { return }
        if !(cardData is Dictionary<String, AnyObject>) { return }
        
        let cardLoyaltyNeed = cardData["loyalty_need"] as! Dictionary<String, Int>
        let cardLoyaltyProduce = cardData["loyalty_produce"] as! Dictionary<String, Int>
        let cardSkills = cardData["skills"] as! NSArray
        
        let newCard = CardTemplate(
            cardId: cardId as! String,
            cardSet: cardData["set"] as! String,
            cardType: CARD_TYPE.stringToCardType(cardData["type"] as! String),
            imageName: cardData["image"] as! String,
            name: cardData["name"] as! String,
            cost: cardData["cost"] as! Int,
            hp: cardData["hp"] as! Int,
            power: cardData["power"] as! Int,
            loyaltyNeed: cardLoyaltyNeed,
            loyaltyProduce: cardLoyaltyProduce,
            skills: []
        )
        self.cardTemplates.append(newCard)
    }
}
