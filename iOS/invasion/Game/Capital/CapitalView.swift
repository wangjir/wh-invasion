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
    
    func setCapital(capital: Capital) {
        // can only be called once
        if ((self.capital) != nil) {
            return
        }
        self.capital = capital
        
        kingdomFV = KingdomFieldView(frame: kingdomView.bounds)
        kingdomFV.setField(self.capital.kingdomField)
        kingdomView.addSubview(kingdomFV)
        
        questFV = QuestFieldView(frame: questView.bounds)
        questFV.setField(self.capital.questField)
        questView.addSubview(questFV)
        
        // battleFV = BattleFieldView()
        // battleFV.setField(self.capital.battleField)
        // var test  = UINib(nibName: "BattleFieldView", bundle: nil).instantiateWithOwner(battleFV, options: nil)[0] as! UIView
        // battlefieldView.addSubview(test)
        
        battleFV = BattleFieldView(frame: battlefieldView.bounds)
        battleFV.setField(self.capital.battleField)
        battlefieldView.addSubview(battleFV)
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.load()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.load()
    }
    
    func load() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "CapitalDownsideView", bundle: bundle)
        let v = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        v.frame = bounds
        addSubview(v)
    }
    
}

class CapitalUpsideView: CapitalView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.load()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.load()
    }
    
    func load() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "CapitalUpsideView", bundle: bundle)
        let v = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        v.frame = bounds
        addSubview(v)
    }
    
}
