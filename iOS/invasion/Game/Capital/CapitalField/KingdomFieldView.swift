//
//  KingdomFieldView.swift
//  invasion
//
//  Created by Jirong Wang on 10/20/15.
//  Copyright © 2015 Jirong Wang. All rights reserved.
//

import UIKit

class KingdomFieldView: UIView {
    
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
            powerLabel.text = "3"
            hpLabel.text = "8"
            cardLabel.text = "0/0"
        }
        
        for v in cardStackList.arrangedSubviews {
            v.removeFromSuperview()
        }
        
        let h = (cardStackList.bounds.height) * 1.0 / CGFloat(capitalField.cards.count)
        let x: CGFloat = (h > 40) ? 40 : h
        
        for c in capitalField.cards {
            cardStackList.addArrangedSubview(miniCardView(c, maxHeight: x))
        }
    }
    
    func miniCardView(card: Card, maxHeight: CGFloat) -> UIView {
        let v = UIView()
        v.heightAnchor.constraintEqualToConstant(maxHeight).active = true
        v.widthAnchor.constraintEqualToConstant(40.0).active = true
        
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

