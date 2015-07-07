//
//  ProductViewController.swift
//  Chilin
//
//  Created by Grace Yin on 7/2/15.
//  Copyright (c) 2015 Grace Yin. All rights reserved.
//

import UIKit
import Foundation

class ProductViewController: UIViewController
{

    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: NSCoder())
    }
    
    //Needs Name, Image, Rating, (eventually comments)
    
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