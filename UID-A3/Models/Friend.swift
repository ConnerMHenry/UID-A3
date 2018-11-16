//
//  Friend.swift
//  UID-A3
//
//  Created by Conner Henry on 2018-11-14.
//  Copyright © 2018 Conner Henry. All rights reserved.
//

import UIKit

public class Friend {
    public private(set) var name: String!
    public private(set) var image: UIImage!
    
    public init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
}
