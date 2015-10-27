//
//  CapitalView.swift
//  Wh
//
//  Created by Jirong Wang on 10/19/15.
//  Copyright © 2015 Jirong Wang. All rights reserved.
//

import UIKit

class CapitalView: UIView {
    
    @IBOutlet weak var battlefieldView: UIView!
    @IBOutlet weak var kingdomView: UIView!
    @IBOutlet weak var questView: UIView!
    @IBOutlet weak var discardView: UIView!
    
    var capital: Capital!
    var kingdomFV: KingdomFieldView!
    var questFV: QuestFieldView!
    var battleFV: BattleFieldView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadSubviews()
    }
    
    func loadSubviews() {
        kingdomFV = UIView.loadFromNibNamed("KingdomFieldView") as! KingdomFieldView
        questFV = UIView.loadFromNibNamed("QuestFieldView") as! QuestFieldView
        battleFV = UIView.loadFromNibNamed("BattleFieldView") as! BattleFieldView
    }
    
    override func layoutSubviews() {
        kingdomView.addSubview(kingdomFV)
        questView.addSubview(questFV)
        battlefieldView.addSubview(battleFV)
        super.layoutSubviews()
    }

    func setCapital(capital: Capital) {
        // can only be called once
        if ((self.capital) != nil) {
            return
        }
        self.capital = capital
        kingdomFV.setField(self.capital.kingdomField)
        questFV.setField(self.capital.questField)
        battleFV.setField(self.capital.battleField)
    }
    
    func resize(frame: CGRect) {
        self.frame = frame
        self.layoutIfNeeded()
        
        kingdomFV.frame = kingdomView.bounds
        questFV.frame = questView.bounds
        battleFV.frame = battlefieldView.bounds
        self.layoutIfNeeded()
        
        kingdomFV.refresh()
        questFV.refresh()
        battleFV.refresh()
    }
}


class CapitalDownsideView: CapitalView {

}

class CapitalUpsideView: CapitalView {

}
