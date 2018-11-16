//
//  NewsFeedControllerViewController.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-15.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit
import SafariServices

public class NewsFeedController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsFeed.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsFeedView", for: indexPath) as? NewsFeedItem {
            cell.feed = newsFeed[indexPath.row]
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    public var artist: Artist! {
        didSet {
            update()
        }
    }
    
    public var newsFeed = [FeedItem]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.register(UINib(nibName: "NewsFeedView", bundle: nil), forCellWithReuseIdentifier: "NewsFeedView")
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        update()
    }
    
    public func update() {
        newsFeed.removeAll()
        if let feed = Data.shared.artistFeed {
            if let artist = artist {
                for i in 0 ..< feed.count {
                    if artist.name == feed[i].artist.name {
                        newsFeed = feed[i].items
                        break
                    }
                }
            }
            else {
                for i in 0 ..< feed.count {
                    newsFeed.append(contentsOf: feed[i].items)
                }
            }
        }
        
        collectionView?.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? NewsFeedItem {
            if let feed = cell.feed, let url = URL(string: feed.link){
                let safariVC = SFSafariViewController(url: url)
                safariVC.preferredControlTintColor = UIColor.white
                safariVC.preferredBarTintColor = UIColor(red: 47/255, green: 49/255, blue: 54/255, alpha: 1.0)
                present(safariVC, animated: true, completion: nil)
            }
        }
    }
    
    
}
