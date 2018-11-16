//
//  HomePageController.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-14.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

public class HomePageController: UIViewController, MusicPlayerDelegate {
    
    @IBOutlet weak var playbarView: UIView!
    @IBOutlet weak var songAlbumImage: UIImageView!
    @IBOutlet weak var songLbl: UILabel!
    @IBOutlet weak var playBtn: UIBarButtonItem!
    
    public private(set) var firstLoad = true
    public private(set) var isPlaybarVisible: Bool = true
    public private(set) var currentSong: Song!
    public private(set) var currentArtist: Artist!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        playbarView.alpha = 0.0
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if firstLoad {
            playbarView.alpha = 0.0
            togglePlaybar(on: false)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.playbarView.alpha = 1.0
            }
            firstLoad = false
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.displayPlayControls(_:)))
        tapGesture.numberOfTapsRequired = 1

    }
    
    @IBAction func onPlayClick(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "musicPlayerSegue", sender: currentSong)
    }
    
    public func play(song: Song) {
        self.currentSong = song
        songLbl.text = "\(song.artist!.name!) - \(song.title!)"
        songAlbumImage.image = song.cover
        
        if !isPlaybarVisible {
            togglePlaybar(on: true)
        }
    }
    
    public func getCurrentSong() -> Song! {
        return currentSong
    }
    
    public func togglePlaybar(on: Bool) {
        if on && !isPlaybarVisible {
            isPlaybarVisible = true
            
            UIView.animate(withDuration: 0.25, animations: {
                self.playbarView.frame.origin.y -= self.playbarView.frame.size.height
            })
        }
        else if !on && isPlaybarVisible {
            isPlaybarVisible = false
            
            UIView.animate(withDuration: 0.25, animations: {
                self.playbarView.frame.origin.y += self.playbarView.frame.size.height
            })
        }
    }
    
    @objc public func displayPlayControls(_ sender: Any?) {
        performSegue(withIdentifier: "musicPlayerSegue", sender: currentSong)
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MusicPlayerController {
            destination.song = sender as? Song
        }
        
        if let destination = segue.destination as? ArtistPageController {
            destination.artist = currentArtist
            destination.delegate = self
        }
        
        super.prepare(for: segue, sender: sender)
    }
}
