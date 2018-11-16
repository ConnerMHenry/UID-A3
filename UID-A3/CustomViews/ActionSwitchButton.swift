//
//  ActionSwitchButton.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-15.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

public class ActionSwitchButton: ActionButton {
    
    @IBInspectable public var on: Bool = false {
        didSet {
            toggleDisplay(on: on)
        }
    }
    
    @IBInspectable public var clickTogglable: Bool = false
    
    public override func setup() {
        super.setup()
        self.addTarget(self, action: #selector(self.touchUpInside), for: .touchUpInside)
        
    }
    
    @objc public func touchUpInside() {
        if clickTogglable || !on {
            on = !on
        }
    }
    
    public func toggleDisplay(on: Bool) {
        if on {
            let title = currentTitle ?? ""
            self.setImage(maskedImage(size: bounds.size, text: title), for: .normal)
            
            clipsToBounds = true
            layer.borderColor = UIColor.clear.cgColor
            tintColor = UIColor.white
        }
        else {
            self.setImage(nil, for: .normal)
            super.setup()
            tintColor = UIColor.clear
        }
    }
    
    // https://stackoverflow.com/questions/36808080/how-do-i-style-a-button-to-have-transparent-text
    func maskedImage(size: CGSize, text: String) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        
        let context = UIGraphicsGetCurrentContext()
        context?.scaleBy(x: 1, y: -1)
        context?.translateBy(x: 0, y: -size.height)
        
        // draw the text
        
        let attributes: [NSAttributedStringKey: Any] = [
            .font: titleLabel?.font ?? UIFont.preferredFont(forTextStyle: .caption1),
            .foregroundColor: UIColor.white
        ]
        let textSize = text.size(withAttributes: attributes)
        let point = CGPoint(x: (size.width - textSize.width) / 2, y: (size.height - textSize.height) / 2)
        text.draw(at: point, withAttributes: attributes)
        
        // capture the image and end context
        
        let maskImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // create image mask
        
        guard let cgimage = maskImage?.cgImage, let dataProvider = cgimage.dataProvider else { return nil }
        
        let bytesPerRow = cgimage.bytesPerRow
        let bitsPerPixel = cgimage.bitsPerPixel
        let width = cgimage.width
        let height = cgimage.height
        let bitsPerComponent = cgimage.bitsPerComponent
        
        guard let mask = CGImage(maskWidth: width, height: height, bitsPerComponent: bitsPerComponent, bitsPerPixel: bitsPerPixel, bytesPerRow: bytesPerRow, provider: dataProvider, decode: nil, shouldInterpolate: false) else { return nil }
        
        // create the actual image
        
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIGraphicsGetCurrentContext()?.clip(to: rect, mask: mask)
        UIColor.white.withAlphaComponent(1.0).setFill()
        UIBezierPath(rect: rect).fill()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // return image
        
        return image
    }
}
