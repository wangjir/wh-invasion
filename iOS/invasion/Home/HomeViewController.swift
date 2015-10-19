//
//  ViewController.swift
//  wh
//
//  Created by Jirong Wang on 10/12/15.
//  Copyright © 2015 Jirong Wang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    
    var cardViewController: CardViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.cardViewController = CardViewController()
        self.view.addSubview(self.cardViewController.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        let ht = HomeTestData(name: "hahaha")
        self.testLabel.text = ht.simple()
        
        let cm = CardManager()
        cm.loadCardFromJson()
        let c = Card(uuid: NSUUID().UUIDString, cardTemplate: cm.cardTemplates[2])
        cardViewController.setupCard(c)
 
        super.viewDidAppear(animated)
    }
}

