//
//  CardView.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-14.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

@IBDesignable
public class CardView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
     public func setup() {
        layer.cornerRadius = 8.0
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
    }
    
    public override func prepareForInterfaceBuilder() {
        setup()
    }

}
