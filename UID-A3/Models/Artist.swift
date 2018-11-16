//
//  Artist.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-14.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

public class Artist {
    public private(set) var name: String!
    public private(set) var portrait: UIImage!
    public private(set) var fullImage: UIImage!
    
    public init(name: String, portrait: UIImage, fullImage: UIImage) {
        self.name = name
        self.portrait = portrait
        self.fullImage = fullImage
    }
}
