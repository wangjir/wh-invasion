//
//  UIView.swift
//  invasion
//
//  Created by Jirong Wang on 10/23/15.
//  Copyright © 2015 Jirong Wang. All rights reserved.
//

import UIKit

extension UIView {
    
    class func loadFromNibNamed(nibNamed: String, bundle : NSBundle? = nil) -> UIView? {
        return UINib(nibName: nibNamed, bundle: bundle).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
}