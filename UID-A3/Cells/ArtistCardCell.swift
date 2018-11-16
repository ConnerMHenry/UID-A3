//
//  ArtistCardCell.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-15.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

public class ArtistCardCell: UITableViewCell {
    
    @IBOutlet weak var artistImg: UIImageView!
    @IBOutlet weak var artistLbl: UILabel!
    @IBOutlet weak var unfollowButton: ActionButton!
    @IBOutlet weak var editButton: ActionButton!
    
    public var delegate: FollowingArtistsController!
    
    public var artist: Artist! {
        didSet {
            if let artist = artist {
                display(artist: artist)
            }
        }
    }
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if let artist = artist {
            display(artist: artist)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if let artist = artist {
            display(artist: artist)
        }
    }
    
    public func display(artist: Artist) {
        let isFirstItem = artist.name == "All Artists"
        unfollowButton.isHidden = isFirstItem
        editButton.isHidden = isFirstItem
        
        artistImg?.image = artist.fullImage
        artistLbl?.text = artist.name
    }
    
    @IBAction func onUnfollowClicked(_ sender: ActionButton) {
        delegate.unfollow(artist: artist)
    }
    
    @IBAction func onEditClicked(_ sender: Any) {
        delegate.edit(artist: artist)
    }
    
}
