//
//  CustomTextField.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-14.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

@IBDesignable public class CustomTextField: UITextField {
    
    public var titleLbl: UILabel! {
        didSet {
            titleColor = titleLbl?.textColor
        }
    }
    private var titleColor: UIColor!
    
    @IBInspectable public var errorColor: UIColor! {
        didSet {
            setup()
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 1.5 {
        didSet {
            setup()
        }
    }
    
    public private(set) var hasError: Bool = false
    
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
    
    private func setup() {
        layer.borderColor = tintColor?.cgColor
        layer.borderWidth = self.borderWidth
        layer.cornerRadius = 5.0
        clipsToBounds = true
        textColor = tintColor
        borderStyle = .roundedRect
        backgroundColor = UIColor.clear
    }
    
    public func error(on: Bool) {
        
        hasError = on
        UIView.animate(withDuration: 0.5, animations: {
            self.titleLbl?.textColor = on ? self.errorColor : self.titleColor
            self.layer.borderColor = on ? self.errorColor?.cgColor : self.tintColor.cgColor
        })
    }
}
