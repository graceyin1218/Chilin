//
//  ProductViewController.swift
//  Chilin
//
//  Created by Grace Yin on 7/2/15.
//  Copyright (c) 2015 Grace Yin. All rights reserved.
//

import UIKit
import Foundation
import Parse
import ParseUI

class ProductViewController: UIViewController
{
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productCreatorLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
        
    var product: PFObject?
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad()
    {
        if product == nil
        {
            return
        }
        
        productNameLabel.text = product!["name"] as? String
        
        productCreatorLabel.text = product!["creator"] as? String
        
        productDescriptionLabel.text = product!["description"] as? String
        
        if let rawImage = product!["image"] as? PFFile
        {
            rawImage.getDataInBackgroundWithBlock{
                (data: NSData?, error: NSError?) -> Void in
                if error == nil
                {
                    if let data = data
                    {
                        self.productImageView.image = UIImage(data: data)
                    }
                }
            }
        }
    }

    //Needs Name, Image, Description, (eventually comments)

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    //on productTableViewCell click.
    //will have to go into database for comments.
        //(Which is when we really need the spinner)
    func displayProduct(name: String, _ image: UIImage?, _ rating: String?)
    {
        spinner?.startAnimating()
        
        //fill in later?
        
        spinner?.stopAnimating()
    }
    
}