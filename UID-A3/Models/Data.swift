//
//  Data.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-14.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

public class Data {
    public static let shared = Data()
    
    private init() {
        artists = [travisScott, eltonJohn, drake]
        musicLibrary = [
            (artist: travisScott, songs:
                [
                    Song(artist: travisScott, title: "SICKO MODE", length: 322, cover: #imageLiteral(resourceName: "AstroWorld"), source: .Spotify),
                    Song(artist: travisScott, title: "SKELETONS", length: 147, cover: #imageLiteral(resourceName: "AstroWorld"), source: .AppleMusic),
                    Song(artist: travisScott, title: "WAKE UP", length: 233, cover: #imageLiteral(resourceName: "AstroWorld"), source: .Spotify)
                ]),
            (artist: eltonJohn, songs:
                [
                    Song(artist: eltonJohn, title: "Crocodile Rock", length: 243, cover: #imageLiteral(resourceName: "Elton John Album"), source: .GoogleMusic),
                    Song(artist: eltonJohn, title: "Bennie and the Jets", length: 310, cover: #imageLiteral(resourceName: "Elton John Album"), source: .Spotify),
                ]),
            (artist: drake, songs:
                [
                    Song(artist: drake, title: "Gods Plan", length: 199, cover: #imageLiteral(resourceName: "Scorpion"), source: .AppleMusic),
                    Song(artist: drake, title: "In My Feelings", length: 216, cover: #imageLiteral(resourceName: "Scorpion"), source: .Spotify),
                    Song(artist: drake, title: "I'm Upset", length: 215, cover: #imageLiteral(resourceName: "Scorpion"), source: .GoogleMusic),
                    Song(artist: drake, title: "Don't Matter To Me", length: 247, cover: #imageLiteral(resourceName: "Scorpion"), source: .Spotify)
                ]),
        ]
        
        artistFeed = [
            (artist: drake, items:
                [
                    FeedItem(artist: drake, description: "Drizzy: Travis Scott - SICKO MODE ft. Drake", link: "https://twitter.com/Drake/status/1055619307084800000", source: .Twitter),
                    FeedItem(artist: drake, description: "Drizzy: Excited and honored to be a part of such an important film. I can’t wait for everyone to experience it.", link: "https://twitter.com/Drake/status/1047988136553271297", source: .Twitter),
                    FeedItem(artist: drake, description: "Drake - Hotline Bling", link: "https://www.youtube.com/watch?v=uxpDa-c-4Mc", source: .Youtube),
                    FeedItem(artist: drake, description: "OPINION: Why Drake is the most important artist of his generation", link: "https://www.joe.ie/music/opinion-drake-important-artist-generation-589999", source: .Facebook)
                    
                ]),
            (artist: eltonJohn, items: [
                FeedItem(artist: eltonJohn, description: "Elton John: One more tour left, before retirement!", link: "", source: .Facebook),
                FeedItem(artist: eltonJohn, description: "I will not apologize for Crocodile Rock. It is a masterpiece", link: "", source: .Instagram)
                ]),
            (artist: travisScott, items: [
                ])
        ]
        
        shoutsFeed = [
            (artist: drake, shouts: [
                Shout(artist: drake, friend: nil, description: "Hey guys! Drakes new album is out and it's fire!!! Haha jk :^)", source: .Youtube),
                Shout(artist: drake, friend: nil, description: "However, Gods Plan is a bop!", source: .Twitter)
            ]),
            (artist: travisScott, shouts: [
                Shout(artist: travisScott, friend: nil, description: "Sicko World is siiick guys", source: .Facebook),
                Shout(artist: travisScott, friend: nil, description: "Scratch that, all of ASTRO WORLD is pretty decent.", source: .Instagram),
                Shout(artist: travisScott, friend: friends[1], description: "Who is this guy? Hello??", source: .Facebook)
            ])
        ]
    }
    
    public let travisScott = Artist(name: "Travis Scott", portrait: #imageLiteral(resourceName: "Travis Scott Long"), fullImage: #imageLiteral(resourceName: "Travis Scott"))
    public let eltonJohn = Artist(name: "Elton John", portrait: #imageLiteral(resourceName: "Elton John Long"), fullImage: #imageLiteral(resourceName: "NowThatsEpic"))
    public let drake = Artist(name: "Drake", portrait: #imageLiteral(resourceName: "Drake Long"), fullImage: #imageLiteral(resourceName: "DrizzymyBoy"))
    public var artists: [Artist]!
    
    public var musicLibrary: [(artist: Artist, songs: [Song])]!
    public var artistFeed: [(artist: Artist, items: [FeedItem])]!
    public var shoutsFeed: [(artist: Artist, shouts: [Shout])]!
    
    public let friends: [Friend] = [
        Friend(name: "Michael Maxner", image: #imageLiteral(resourceName: "Mike")),
        Friend(name: "Jason Gemanaru", image: #imageLiteral(resourceName: "Jason"))
    ]
}
