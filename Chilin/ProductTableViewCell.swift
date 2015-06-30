//
//  ProductTableViewCell.swift
//  Chilin
//
//  Created by Grace Yin on 6/30/15.
//  Copyright (c) 2015 Grace Yin. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ProductTableViewCell: PFTableViewCell {

    @IBOutlet weak var productImageView: UIImageView?
    @IBOutlet weak var productNameLabel: UILabel?
    @IBOutlet weak var productRatingLabel: UILabel?
    //@IBOutlet weak var productCreatorLabel: UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
