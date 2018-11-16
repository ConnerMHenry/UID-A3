//
//  RoundedView.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-14.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

@IBDesignable public class RoundedView: UIView {

    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            setup()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func setup() {
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
    }
    
    public override func prepareForInterfaceBuilder() {
        setup()
    }

}
