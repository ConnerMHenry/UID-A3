//
//  MusicPlayerDelegate.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-15.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import Foundation

public protocol MusicPlayerDelegate {
    func play(song: Song)
    func getCurrentSong() -> Song!
}
