//
//  ArtistPageController.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-14.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

public class ArtistPageController: UIViewController {
    
    @IBOutlet weak var artistLbl: UILabel!
    @IBOutlet weak var artistPortrait: UIImageView!
    
    @IBOutlet weak var streamBtn: ActionSwitchButton!
    @IBOutlet weak var newsBtn: ActionSwitchButton!
    @IBOutlet weak var shoutsBtn: ActionSwitchButton!
    @IBOutlet weak var containerView: UIView!
    
    private lazy var musicFeedController: MusicFeedController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "MusicFeedController") as! MusicFeedController
        
        return viewController
    }()
    
    private lazy var feedViewController: NewsFeedController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "NewsFeedController") as! NewsFeedController
        
        return viewController
    }()
    
    private lazy var shoutsController: ShoutsController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "ShoutsController") as! ShoutsController
        
        return viewController
    }()
    
    
    public enum Feed {
        case Stream
        case News
        case Shouts
    }
    
    public var currentFeed = Feed.Stream {
        didSet {
            updateFeedView()
        }
    }
    
    public var artist: Artist! {
        didSet {
            updateView(display: artist)
        }
    }
    public var delegate: MusicPlayerDelegate!
    
    public var fullNewsFeed = Data.shared.artistFeed
    public var fullMusicFeed = Data.shared.musicLibrary
    
    public override func viewDidLoad() {
        updateView(display: artist)
        add(asChildViewController: musicFeedController)
    }
    
    private func updateView(display artist: Artist?) {
        if let artist = artist {
            artistLbl?.text = artist.name
            artistPortrait?.image = artist.portrait
        }
        else {
            artistLbl?.text = "All Artists"
            artistPortrait?.image = #imageLiteral(resourceName: "epicmicrophone")
        }
        
        musicFeedController.artist = artist
        musicFeedController.delegate = delegate
        
        feedViewController.artist = artist
        shoutsController.artist = artist
    }
    
    private func updateFeedView() {
        switch(currentFeed) {
            case .Stream:
                self.add(asChildViewController: musicFeedController)
                self.remove(asChildViewController: feedViewController)
                self.remove(asChildViewController: shoutsController)
                break
            
            case .News:
                self.remove(asChildViewController: shoutsController)
                self.remove(asChildViewController: musicFeedController)
                self.add(asChildViewController: feedViewController)
                break
            
            case .Shouts:
                self.remove(asChildViewController: musicFeedController)
                self.remove(asChildViewController: feedViewController)
                self.add(asChildViewController: shoutsController)
                break
        }
    }
    @IBAction func onFeedButtonClicked(_ sender: ActionSwitchButton) {
        if sender === streamBtn {
            newsBtn.on = false
            shoutsBtn.on = false
            currentFeed = .Stream
        }
        else if sender === newsBtn {
            streamBtn.on = false
            shoutsBtn.on = false
            currentFeed = .News
        }
        else if sender === shoutsBtn {
            newsBtn.on = false
            streamBtn.on = false
            currentFeed = .Shouts
        }
    }
    
    // Source: https://cocoacasts.com/managing-view-controllers-with-container-view-controllers/
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChildViewController(viewController)
        
        if let containerView = containerView {
            // Add Child View as Subview
            containerView.addSubview(viewController.view)
            
            // Configure Child View
            viewController.view.frame = containerView.bounds
            viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }
    
    @IBAction func onSwipeRight(_ sender: Any) {
        
    }
    
    
    @IBAction func onSwipeLeft(_ sender: Any) {
        
    }
    
    @IBAction func onSelectArtistcClicked(_ sender: Any) {
        performSegue(withIdentifier: "followingArtistsSegue", sender: nil)
    }
    
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FollowingArtistsController {
            destination.delegate = self
        }
    }
    
}
