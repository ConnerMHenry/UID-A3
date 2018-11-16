//
//  Song.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-14.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

public class Song {
    public private(set) var title: String!
    public private(set) var artist: Artist!
    public private(set) var length: Int!
    public private(set) var cover: UIImage!
    public private(set) var source: MusicSources!
    
    public init(artist: Artist, title: String, length: Int, cover: UIImage, source: MusicSources) {
        self.title = title
        self.artist = artist
        self.length = length
        self.cover = cover
        self.source = source
    }
}
