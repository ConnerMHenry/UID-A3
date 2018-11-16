//
//  ShoutsController.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-15.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

public class ShoutsController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    public var artist: Artist! {
        didSet {
            setup()
        }
    }
    public var shouts = [Shout]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shouts.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoutsView", for: indexPath) as? ShoutsFeedView {
            cell.shout = shouts[indexPath.row]
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ShoutsFeedView {
            if let shout = cell.shout {
                performSegue(withIdentifier: "shoutDetailSegue", sender: shout)
            }
        }
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let dest = segue.destination as? ShoutDetailController {
            dest.shout = sender as? Shout
        }
        
        super.prepare(for: segue, sender: sender)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.register(UINib(nibName: "ShoutsView", bundle: nil), forCellWithReuseIdentifier: "ShoutsView")
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        setup()
    }
    
    public func setup() {
        shouts.removeAll()
        if let feed = Data.shared.shoutsFeed {
            if let artist = artist {
                for i in 0 ..< feed.count {
                    if artist.name == feed[i].artist.name {
                        shouts = feed[i].shouts
                        break
                    }
                }
            }
            else {
                for i in 0 ..< feed.count {
                    shouts.append(contentsOf: feed[i].shouts)
                }
            }
        }
        collectionView?.reloadData()
    }
}
