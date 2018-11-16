//
//  Shout.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-15.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

public class Shout {
    public var artist: Artist!
    public var song: Song!
    public var friend: Friend!
    public var description: String!
    public var source: FeedSources!
    
    init(artist: Artist, friend: Friend!, description: String, source: FeedSources) {
        self.artist = artist
        self.friend = friend
        self.description = description
        self.source = source
    }
    
    init(song: Song, friend: Friend!, description: String, source: FeedSources) {
        self.song = song
        self.artist = song.artist
        self.friend = friend
        self.description = description
        self.source = source
    }
}
