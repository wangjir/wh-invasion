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
    
    var controller: CardPanelViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.controller = CardPanelViewController()
        // self.view.addSubview(self.controller.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        let ht = HomeTestData(name: "hahaha")
        self.testLabel.text = ht.simple()
        /*
        let h = self.view.frame.height - 120
        let w = self.view.frame.width
        self.controller.view.frame = CGRect(x: 0, y: h, width: w, height: 120)
        
        let game = InvasionGame()
        game.initGame()
        self.controller.setupPlayer(game.battleground!.players[1])
        
        self.controller.refresh()
        */
        super.viewDidAppear(animated)
    }
}

