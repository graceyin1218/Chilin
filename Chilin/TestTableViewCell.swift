//
//  TestTableViewCell.swift
//  Chilin
//
//  Created by Grace Yin on 7/7/15.
//  Copyright (c) 2015 Grace Yin. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    var name: String?
    {
        didSet
        {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI()
    {
        println("updateUI")
        label.text = name
    }

}
