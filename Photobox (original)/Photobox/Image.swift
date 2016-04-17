//
//  Image.swift
//  Photobox
//
//  Created by yi shing wong on 16/4/2016.
//  Copyright © 2016 yi shing wong. All rights reserved.
//

import UIKit

class Image {
    var name = ""
    var image:UIImage?
    
    init?(name: String, image: UIImage?) {
        self.name = name
        self.image = image
        
        if name.isEmpty {
            return nil
        }
    }
}
