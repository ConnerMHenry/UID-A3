//
//  FeedItem.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-14.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import Foundation

public class FeedItem {
    public private(set) var source: FeedSources!
    public private(set) var description: String!
    public private(set) var link: String!
    public private(set) var artist: Artist!
    
    public init(artist: Artist, description: String, link: String, source: FeedSources) {
        self.description = description
        self.link = link
        self.source = source
        self.artist = artist
    }
    
    
}
