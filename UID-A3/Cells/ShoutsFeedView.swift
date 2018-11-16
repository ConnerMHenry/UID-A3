//
//  ShoutsFeedView.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-15.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

public class ShoutsFeedView: UICollectionViewCell {
    
    @IBOutlet weak var sourceImg: UIImageView!
    @IBOutlet weak var artistImg: UIImageView!
    @IBOutlet weak var userLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UITextView!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    public var shout: Shout! {
        didSet {
            setup()
        }
    }
    
    public func setup() {
        if let source = shout?.source {
            switch source {
            case .Youtube:
                sourceImg?.image = #imageLiteral(resourceName: "youtube")
                break
                
            case .Instagram:
                sourceImg?.image = #imageLiteral(resourceName: "instagram")
                break
                
            case .Twitter:
                sourceImg?.image = #imageLiteral(resourceName: "twitter")
                break
                
            case .Facebook:
                sourceImg?.image = #imageLiteral(resourceName: "facebook")
                break
                
            default:
                break
            }
        }
        
        userLbl?.text = shout?.friend?.name ?? "You"
        artistImg?.image = shout?.artist.fullImage
        descriptionLbl?.text = shout?.description
    }
    
}
