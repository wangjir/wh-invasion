//
//  CardPanelViewController.swift
//  invasion
//
//  Created by Jirong Wang on 10/21/15.
//  Copyright © 2015 Jirong Wang. All rights reserved.
//

import GLFoundation
import UIKit

class CardPanelViewController: UIViewController {
    
    @IBOutlet weak var cardListView: UIStackView!
    @IBOutlet weak var contentWidth: NSLayoutConstraint!
    
    var player: Player!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.layer.borderColor = UIColor.blackColor().CGColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupPlayer(player: Player) {
        self.player = player
    }
    
    func refresh() {
        var w : CGFloat = CGFloat(self.player.handCards.count) * (60.0 + 3) // 3 is spacing
        if w <= 200 {
            w = 200
        }
        self.contentWidth.constant = w
        
        for v in cardListView.arrangedSubviews {
            v.removeFromSuperview()
        }
        
        for i in 0..<self.player.handCards.count {
            let v = miniCardView(self.player.handCards[i])
            v.tag = 100 + i
            cardListView.addArrangedSubview(v)
        }
    }
    
    func miniCardView(card: Card) -> UIView {
        let v = UIView()
        v.heightAnchor.constraintEqualToConstant(100).active = true
        v.widthAnchor.constraintEqualToConstant(60).active = true
        
        let img = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 100))
        img.image = UIImage(named: card.cardTemplate.imageName)
        v.addSubview(img)
        
        let lb = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        lb.textColor = UIColor.whiteColor()
        lb.text = "\(card.currentPower)/\(card.currentHP)"
        v.addSubview(lb)
        
        let gesture = UITapGestureRecognizer(target: self, action: "handCardSelected:")
        v.addGestureRecognizer(gesture)

        return v
    }
    
    @IBAction func closePanelClicked(sender: AnyObject) {
        publish(EVENT_CLOSE_CARD_PANEL)
    }
    
    func handCardSelected(sender: UITapGestureRecognizer) {
        let i : Int = sender.view!.tag - 100
        let c = self.player.handCards[i]
        publish(EVENT_SHOW_CARD_ACTION_PANEL, data: ["card": c])
    }

}
