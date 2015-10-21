//
//  BattlegroundViewController.swift
//
//  Created by Jirong Wang on 10/19/15.
//  Copyright © 2015 Jirong Wang. All rights reserved.
//

import UIKit

class BattlegroundViewController: UIViewController {

    @IBOutlet weak var controlPaneView: UIView!
    @IBOutlet weak var oppnCapitalViewContainer: UIView!
    @IBOutlet weak var yourCapitalViewContainer: UIView!
    @IBOutlet weak var cardPanelViewContainer: UIView!
    
    @IBOutlet weak var expandCardPanelButton: UIButton!
    
    var game: InvasionGame!
    var battleground: Battleground!
    
    var yourCapital: CapitalDownsideView!
    var oppnCapital: CapitalUpsideView!
    var cardPanel: CardPanelViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        game = InvasionGame()
        game.initGame()
        
        battleground = game.battleground
        
        yourCapital = CapitalDownsideView(frame: self.yourCapitalViewContainer.bounds)
        yourCapital.setCapital(battleground.players[0].capital)
        
        oppnCapital = CapitalUpsideView(frame: self.oppnCapitalViewContainer.bounds)
        oppnCapital.setCapital(battleground.players[1].capital)
        
        cardPanel = CardPanelViewController()
        cardPanel.setupPlayer(battleground.players[0])
        
        self.yourCapitalViewContainer.addSubview(yourCapital)
        self.oppnCapitalViewContainer.addSubview(oppnCapital)
        self.cardPanelViewContainer.hidden = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        yourCapital.resize(self.yourCapitalViewContainer.bounds)
        oppnCapital.resize(self.oppnCapitalViewContainer.bounds)
        super.viewDidAppear(animated)
    }
    
    @IBAction func expandCardPanelClicked(sender: AnyObject) {
        if (!self.cardPanelViewContainer.hidden) {
            return
        }
        self.cardPanelViewContainer.hidden = false
        self.cardPanelViewContainer.addSubview(cardPanel.view)
        cardPanel.view.frame = self.cardPanelViewContainer.bounds
        cardPanel.refresh()
        
    }
    
}