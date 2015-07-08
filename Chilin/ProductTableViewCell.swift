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

    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var productDescription: UILabel!

    
    var product: PFObject?
    {
        didSet
        {
            updateUI()
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }

    func updateUI()
    {
        
        productNameLabel.text = ""
        productImageView.image = nil
        productDescription.text = ""

        if let product = self.product
        {
            productNameLabel?.text = product["name"] as? String
            
            if let description = product["description"] as? String
            {
                productDescription?.text = description
            }
            
            if let rawImage = product["image"] as? PFFile
            {
                rawImage.getDataInBackgroundWithBlock{
                    (data: NSData?, error: NSError?) -> Void in
                    if error == nil
                    {
                        if let data = data
                        {
                            self.productImageView?.image = UIImage(data: data)
                        }
                    }
                    
                    
                }
            }
        }
    }

    
}
