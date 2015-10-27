//
//  CardActionViewController.swift
//  invasion
//
//  Created by Jirong Wang on 10/22/15.
//  Copyright © 2015 Jirong Wang. All rights reserved.
//

import UIKit

class CardActionViewController: UIViewController {
    
    @IBOutlet weak var cardViewContainer: UIView!
    @IBOutlet weak var useButton: UIButton!
    @IBOutlet weak var developmentButton: UIButton!

    var cardView: CardView!
    var card: Card!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cardView = UIView.loadFromNibNamed("CardView") as! CardView
        self.cardViewContainer.addSubview(cardView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        cardView.frame = self.cardViewContainer.bounds
        super.viewWillAppear(animated)
    }
    
    func setupCard(card: Card) {
        self.card = card
        if (self.viewIfLoaded != nil) {
            cardView.setupCard(card)
        }
    }
    
    @IBAction func closeButtonClicked(sender: AnyObject) {
        publish(EVENT_HIDE_CARD_ACTION_PANEL)
    }
    
    @IBAction func useButtonClicked(sender: AnyObject) {
    }
    
    @IBAction func developmentButtonClicked(sender: AnyObject) {
    }
    
}
