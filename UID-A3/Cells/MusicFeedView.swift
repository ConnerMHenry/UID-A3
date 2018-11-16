//
//  MusicFeedViewCollectionViewCell.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-15.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

public class MusicFeedView: UICollectionViewCell {
    
    @IBOutlet weak var artistImg: UIImageView!
    @IBOutlet weak var albumImg: UIImageView!
    @IBOutlet weak var sourceImg: UIImageView!
    @IBOutlet weak var songLbl: UILabel!
    @IBOutlet weak var artistLbl: UILabel!
    @IBOutlet var playBtn: UIBarButtonItem!
    @IBOutlet var pauseBtn: UIBarButtonItem!
    @IBOutlet weak var toolbar: CustomToolbar!
    
    public var delegate: MusicPlayerDelegate!
    public var song: Song! {
        didSet {
            setup()
        }
    }
    
    public private(set) var isPlaying = false
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        if let song = song, let artist = song.artist {
            // Set Artist Controls
            artistLbl?.text = artist.name
            artistImg?.image = artist.fullImage
            
            // Set Song Controls
            songLbl?.text = song.title
            albumImg?.image = song.cover
            
            switch(song.source!) {
                case .AppleMusic:
                    sourceImg.image = #imageLiteral(resourceName: "AppleMusic")
                    break
                
                case .GoogleMusic:
                    sourceImg.image = #imageLiteral(resourceName: "GooglePlay")
                    break
                
                case .Spotify:
                    sourceImg.image = #imageLiteral(resourceName: "Spotify")
                    break
            }
        }
        
        if var items = toolbar?.items, items[2] === pauseBtn {
            items.remove(at: 2)
            toolbar?.setItems(items, animated: false)
        }
    }
    
    @IBAction func onPlayClicked(_ sender: UIBarButtonItem) {
        isPlaying = !isPlaying
        
        togglePlay(on: isPlaying)
        if isPlaying {
            delegate?.play(song: song)
        }
    }
    
    public func togglePlay(on: Bool) {
        if var items = toolbar?.items {
            items[1] = on ? pauseBtn : playBtn
            toolbar?.setItems(items, animated: false)
        }
    }
}
