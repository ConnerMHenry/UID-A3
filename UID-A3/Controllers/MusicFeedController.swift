//
//  MusicFeedController.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-15.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

public class MusicFeedController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private let reuseIdentifier = "MusicFeedView"
    private var musicFeed = [Song]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    public var delegate: MusicPlayerDelegate!
    public var artist: Artist! {
        didSet {
            updateFeed()
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView?.register(UINib(nibName: "MusicFeedView", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        updateFeed()
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public func updateFeed() {
        if let artist = artist {
            for library in Data.shared.musicLibrary {
                if library.artist === artist {
                    musicFeed = library.songs
                    break
                }
            }
        }
        else {
            musicFeed.removeAll()
            for library in Data.shared.musicLibrary {
                musicFeed.append(contentsOf: library.songs)
            }
        }
        
        collectionView?.reloadData()
    }

    // MARK: UICollectionViewDataSource

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicFeed.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? MusicFeedView {
            cell.song = musicFeed[indexPath.row]
            cell.delegate = self
            // Toggle play on
            if let currentSong = getCurrentSong() {
                let isPlaying = cell.song?.title == currentSong.title
                cell.togglePlay(on: isPlaying)
            }
            return cell
        }

        return UICollectionViewCell()
    }

    // MARK: UICollectionViewDelegate

    
    //Uncomment this method to specify if the specified item should be highlighted during tracking
    public func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return false
    }

}

extension MusicFeedController: MusicPlayerDelegate {
    
    public func play(song: Song) {
        delegate.play(song: song)
        pauseAllSongs(except: song)
    }
    
    public func pauseAllSongs(except currentSong: Song) {
        for i in 0 ..< musicFeed.count {
            if musicFeed[i].title != currentSong.title {
                let indexPath = IndexPath(row: i, section: 0)
                if let cell = collectionView?.cellForItem(at: indexPath) as? MusicFeedView {
                    cell.togglePlay(on: false)
                }
            }
        }
    }
    
    public func getCurrentSong() -> Song! {
        return delegate.getCurrentSong()
    }
}
