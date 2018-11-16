//
//  NewsFeedItem.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-15.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

public class NewsFeedItem: UICollectionViewCell {
    
    @IBOutlet weak var sourceImg: UIImageView!
    @IBOutlet weak var drakeImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UITextView!
    
    public var feed: FeedItem! {
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
    
    public func setup() {
        
        if let feed = feed {
            drakeImg?.image = feed.artist?.fullImage
            descriptionLbl.text = feed.description
        }
        
        if let source = feed?.source {
            switch source {
            case .Youtube:
                sourceImg?.image = #imageLiteral(resourceName: "youtube")
                titleLbl?.text = feed.artist?.name ?? "" + " - Youtube"
                break
                
            case .Instagram:
                sourceImg?.image = #imageLiteral(resourceName: "instagram")
                titleLbl?.text = feed.artist?.name ?? "" + " - Instagram"
                break
                
            case .Twitter:
                sourceImg?.image = #imageLiteral(resourceName: "twitter")
                titleLbl?.text = feed.artist?.name ?? "" + " - Twitter"
                break
                
            case .Facebook:
                sourceImg?.image = #imageLiteral(resourceName: "facebook")
                titleLbl?.text = feed.artist?.name ?? "" + " - Facebook"
                break
                
            default:
                break
            }
        }
    }
}
