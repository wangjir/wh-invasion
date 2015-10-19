//
//  CapitalView.swift
//  Wh
//
//  Created by Jirong Wang on 10/19/15.
//  Copyright © 2015 Jirong Wang. All rights reserved.
//

import UIKit

class CapitalView: UIView {
    /*
    @IBOutlet weak var BattlefieldView: UIView!
    @IBOutlet weak var KingdomView: UIView!
    @IBOutlet weak var QuestView: UIView!
    @IBOutlet weak var DiscardView: UIView!
    */

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