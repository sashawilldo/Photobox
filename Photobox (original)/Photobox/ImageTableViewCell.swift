//
//  ImageTableViewCell.swift
//  Photobox
//
//  Created by yi shing wong on 16/4/2016.
//  Copyright © 2016 yi shing wong. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    
    // MARK: Outlets
    @IBOutlet weak var displayImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
