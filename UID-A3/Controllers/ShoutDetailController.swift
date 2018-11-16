//
//  ShoutDetailController.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-15.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

public class ShoutDetailController: UIViewController {
    
    @IBOutlet weak var sourceimg: UIImageView!
    @IBOutlet weak var artistImg: UIImageView!
    @IBOutlet weak var artistLbl: UILabel!
    @IBOutlet weak var descriptLbl: UITextView!
    
    @IBOutlet weak var userLbl: UILabel!
    
    public var shout : Shout! {
        didSet {
            setup()
        }
    }
    
    public override func viewDidLoad() {
        setup()
    }
    
    public func setup() {
        if let shout = shout {
            userLbl?.text = shout.friend?.name ?? "You"
            artistLbl?.text = shout.artist?.name
            artistImg?.image = shout.artist?.fullImage
            descriptLbl?.text = shout.description
            
            if let source = shout.source {
                switch source {
                case .Youtube:
                    sourceimg?.image = #imageLiteral(resourceName: "youtube")
                    break
                    
                case .Instagram:
                    sourceimg?.image = #imageLiteral(resourceName: "instagram")
                    break
                    
                case .Twitter:
                    sourceimg?.image = #imageLiteral(resourceName: "twitter")
                    break
                    
                case .Facebook:
                    sourceimg?.image = #imageLiteral(resourceName: "facebook")
                    break
                    
                default:
                    break
                }
            }
        }
    }
    
    @IBAction func onBackClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
