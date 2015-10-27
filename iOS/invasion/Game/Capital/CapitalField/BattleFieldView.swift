//
//  BattleFieldView.swift
//  invasion
//
//  Created by Jirong Wang on 10/21/15.
//  Copyright © 2015 Jirong Wang. All rights reserved.
//

import UIKit

class BattleFieldView: UIView {
    
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardStackList: UIStackView!
    
    var capitalField: CapitalField!
    
    func setField(capitalField : CapitalField) {
        if ((self.capitalField) == nil) {
            self.capitalField = capitalField
        }
    }
    
    func refresh() {
        if ((capitalField) != nil) {
            powerLabel.text = "\(capitalField.currentPower())"
            hpLabel.text = "\(capitalField.maxHP())-\(capitalField.damage)"
            cardLabel.text = "\(capitalField.cards.count)/\(capitalField.developments.count)"
        } else {
            powerLabel.text = "0"
            hpLabel.text = "8"
            cardLabel.text = "0/0"
        }
        
        for v in cardStackList.arrangedSubviews {
            v.removeFromSuperview()
        }
        
        let w = (cardStackList.bounds.width) * 1.0 / CGFloat(capitalField.cards.count)
        let x: CGFloat = (w > 40) ? 40 : w
        
        for c in capitalField.cards {
            cardStackList.addArrangedSubview(miniCardView(c, maxWeight: x))
        }
    }

    func miniCardView(card: Card, maxWeight: CGFloat) -> UIView {
        let v = UIView()
        v.heightAnchor.constraintEqualToConstant(50.0).active = true
        v.widthAnchor.constraintEqualToConstant(maxWeight).active = true
        
        let img = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        img.image = UIImage(named: card.cardTemplate.imageName)
        v.addSubview(img)
        
        let lb = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        lb.textColor = UIColor.whiteColor()
        lb.text = "\(card.currentPower)/\(card.currentHP)"
        v.addSubview(lb)
        
        return v
    }
}

