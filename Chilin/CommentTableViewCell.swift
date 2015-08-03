//
//  CommentTableViewCell.swift
//  Chilin
//
//  Created by Grace Yin on 8/1/15.
//  Copyright © 2015 Grace Yin. All rights reserved.
//

// Restore ID: CommentCell

import UIKit

class CommentTableViewCell: UITableViewCell {

// Data
    var comment: String = ""
    var creatorName: String = ""
    var creatorPic: UIImage? = nil
    
// Outlets
    
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentField: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func updateUI()
    {
        userIcon.image = creatorPic
        nameLabel.text = creatorName
        commentField.text = comment
    }
}
