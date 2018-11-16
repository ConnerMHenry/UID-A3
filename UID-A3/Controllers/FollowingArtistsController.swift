//
//  FollowingArtistsController.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-15.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

public class FollowingArtistsController: UIViewController {
    var artists = [Artist]()
    
    @IBOutlet weak var tableView: UITableView!
    public var delegate: ArtistPageController!
    
    public override func viewDidLoad() {
        artists.append(Artist(name: "All Artists", portrait: #imageLiteral(resourceName: "epicmicrophone"), fullImage: #imageLiteral(resourceName: "epicmicrophone")))
        if let allArtists = Data.shared.artists {
            artists.append(contentsOf: allArtists)
        }
        
        tableView?.register(UINib(nibName: "ArtistCardCell", bundle: nil), forCellReuseIdentifier: "ArtistCardCell")
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    
    public func unfollow(artist: Artist) {
        let alert = UIAlertController(
            title: "Unfollow?",
            message: "Are you sure you want to unfollow \(artist.name!)? You can re-follow them from the 'Following Artists' page again at any time." ,
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Unfollow", style: .destructive, handler: { _ in
            
            for index in 0 ..< self.artists.count {
                if self.artists[index].name == artist.name {
                    self.artists.remove(at: index)
                    self.tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .fade)
                    break
                }
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    public func edit(artist: Artist) {
        performSegue(withIdentifier: "artistEditSegue", sender: artist)
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EditArtistController {
            destination.artist = sender as? Artist
        }
        
        super.prepare(for: segue, sender: nil)
    }
}

extension FollowingArtistsController : UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let artist = artists[indexPath.row]
        
        delegate?.artist = artist.name == "All Artists" ? nil : artist
        dismiss(animated: true, completion: nil)
    }
}

extension FollowingArtistsController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistCardCell", for: indexPath) as? ArtistCardCell {
            cell.artist = artists[indexPath.row]
            cell.delegate = self
            return cell
        }
        
        return UITableViewCell()
    }
}
