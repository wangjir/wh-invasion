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

    var cardViewController: CardViewController!
    var card: Card!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cardViewController = CardViewController()
        self.cardViewContainer.addSubview(cardViewController.view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        cardViewController.setupCard(card)
        super.viewWillAppear(animated)
    }
    
    func setupCard(card: Card) {
        self.card = card
    }
    
    @IBAction func useButtonClicked(sender: AnyObject) {
    }
    
    @IBAction func developmentButtonClicked(sender: AnyObject) {
    }
    
}
