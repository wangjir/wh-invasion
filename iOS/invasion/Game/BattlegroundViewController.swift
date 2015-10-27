//
//  BattlegroundViewController.swift
//
//  Created by Jirong Wang on 10/19/15.
//  Copyright © 2015 Jirong Wang. All rights reserved.
//

import GLFoundation
import UIKit

class BattlegroundViewController: UIViewController {

    @IBOutlet weak var controlPaneView: UIView!
    @IBOutlet weak var oppnCapitalViewContainer: UIView!
    @IBOutlet weak var yourCapitalViewContainer: UIView!
    @IBOutlet weak var cardPanelViewContainer: UIView!
    @IBOutlet weak var cardActionPanelContainer: UIView!
    
    @IBOutlet weak var expandCardPanelButton: UIButton!
    
    var game: InvasionGame!
    var battleground: Battleground!
    
    var yourCapital: CapitalDownsideView!
    var oppnCapital: CapitalUpsideView!
    var cardPanel: CardPanelViewController!
    
    var cardActionViewController: CardActionViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.cardActionViewController = CardActionViewController()
        yourCapital = UIView.loadFromNibNamed("CapitalDownsideView") as! CapitalDownsideView
        oppnCapital = UIView.loadFromNibNamed("CapitalUpsideView") as! CapitalUpsideView
        
        self.yourCapitalViewContainer.addSubview(yourCapital)
        self.oppnCapitalViewContainer.addSubview(oppnCapital)
        self.cardActionPanelContainer.addSubview(self.cardActionViewController.view)
        self.cardPanelViewContainer.hidden = true
        self.cardActionPanelContainer.hidden = true
        
        self.subscribeEvents()
        
        // below is test code
        game = InvasionGame()
        game.initGame()
        
        battleground = game.battleground
        
        yourCapital.setCapital(battleground.players[0].capital)
        oppnCapital.setCapital(battleground.players[1].capital)
        
        cardPanel = CardPanelViewController()
        cardPanel.setupPlayer(battleground.players[0])
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        self.cardPanelViewContainer.removeAllSubviews()
        self.cardPanelViewContainer.addSubview(cardPanel.view)
        cardPanel.view.frame = self.cardPanelViewContainer.bounds
        
        yourCapital.resize(self.yourCapitalViewContainer.bounds)
        oppnCapital.resize(self.oppnCapitalViewContainer.bounds)
        super.viewDidAppear(animated)
        
    }
    
    func subscribeEvents() {
        subscribe(EVENT_CLOSE_CARD_PANEL) { event in
            self.closeCardPanel()
        }
        subscribe(EVENT_SHOW_CARD_ACTION_PANEL) { event in
            let data = event.data as! NSDictionary
            let c = data["card"]
            self.showCardActionView(c as! Card)
        }
        subscribe(EVENT_HIDE_CARD_ACTION_PANEL) { event in
            self.hideCardActionView()
        }
    }
    
    /* hand-cards panel functions */
    @IBAction func expandCardPanelClicked(sender: AnyObject) {
        if (!self.cardPanelViewContainer.hidden) {
            return
        }
        expandCardPanel()
    }
    
    func expandCardPanel() {
        self.cardPanelViewContainer.hidden = false
        cardPanel.refresh()
    }
    
    func closeCardPanel() {
        self.cardPanelViewContainer.hidden = true
    }
    
    /* card action panel functions */
    func showCardActionView(card: Card) {
        cardActionViewController.setupCard(card)
        self.cardActionPanelContainer.hidden = false
            /*
            v.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
            v.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 100.0).active = true
            v.widthAnchor.constraintEqualToConstant(v.frame.width).active = true
            v.heightAnchor.constraintEqualToConstant(v.frame.height).active = true
            */
    }
    
    func hideCardActionView() {
        self.cardActionPanelContainer.hidden = true
    }
}
