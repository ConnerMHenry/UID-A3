//
//  MusicPlayerController.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-14.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

public class MusicPlayerController: UIViewController {
    
    
    @IBOutlet weak var songImg: UIImageView!
    @IBOutlet weak var songLbl: UILabel!
    @IBOutlet weak var artistsLbl: UILabel!
    
    public var song: Song! {
        didSet {
            updateView(song: song)
        }
    }
    
    public func updateView(song: Song) {
        songImg?.image = song.cover
        songLbl?.text = song.title
        artistsLbl?.text = song.artist.name
    }
    
    public override func viewDidLoad() {
        if let song = song {
            updateView(song: song)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapAway(_:)))
        tapGesture.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc public func tapAway(_ sender: Any?) {
        dismiss(animated: true, completion: nil)
    }
}
