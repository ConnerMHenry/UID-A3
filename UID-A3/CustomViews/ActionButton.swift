//
//  ActionButton.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-15.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

@IBDesignable public class ActionButton: UIButton {
    
    @IBInspectable public var cornerRadius: CGFloat = 10 {
        didSet {
            setup()
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 1.5 {
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
        setup()
    }
    
    public override func prepareForInterfaceBuilder() {
        setup()
    }
    
    public func setup() {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = currentTitleColor.cgColor
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 2.5
        layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        
        addTarget(self, action: #selector(self.touchedInside), for: .touchDown)
        addTarget(self, action: #selector(self.touchCancelled), for: .touchCancel)
    }
    
    @objc public func touchedInside() {
        layer.borderColor = currentTitleColor.cgColor
    }
    
    @objc public func touchCancelled() {
        layer.borderColor = currentTitleColor.cgColor
    }
}
