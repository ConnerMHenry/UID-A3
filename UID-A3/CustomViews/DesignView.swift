//
//  DesignView.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-14.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

@IBDesignable public class DesignView : UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
//        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        backgroundColor = UIColor.clear
        alpha = 0.0
        
        UIView.animate(withDuration: 3.25, animations: {
            self.alpha = 1.0
        })
    }
    
    override public func prepareForInterfaceBuilder() {
        backgroundColor = UIColor.black
    }
    
}
