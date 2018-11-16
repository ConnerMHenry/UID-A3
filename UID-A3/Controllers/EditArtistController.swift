//
//  EditArtistController.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-15.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

public class EditArtistController: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var artistImg: UIImageView!
    @IBOutlet weak var twitterSwtch: UISwitch!
    @IBOutlet weak var instagramSwtch: UISwitch!
    @IBOutlet weak var facebookSwtch: UISwitch!
    
    @IBOutlet weak var appleMusicSwtch: UISwitch!
    @IBOutlet weak var googlePlaySwtch: UISwitch!
    @IBOutlet weak var spotfitySwtch: UISwitch!
    
    public var artist: Artist! {
        didSet {
            updateView()
        }
    }
    
    public override func viewDidLoad() {
        updateView()
    }
    
    public func updateView() {
        if let artist = artist {
            titleLbl?.text = artist.name
            artistImg?.image = artist.fullImage
        }
    }
    
    @IBAction func onSwitchChanged(_ sender: Any) {
        
    }
    
    
    @IBAction func onBackClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
