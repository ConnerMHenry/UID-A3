//
//  UIView+Ext.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-14.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

extension UIView {
    
    public func blink(on: Bool) {
        if on {
            alpha = 0.0
        }
        
        UIView.animate(withDuration: 0.25, animations: {
            self.alpha = on ? 1.0 : 0.0
        })
    }
}
