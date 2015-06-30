//
//  ProductTableViewController.swift
//  Chilin
//
//  Created by Grace Yin on 6/30/15.
//  Copyright (c) 2015 Grace Yin. All rights reserved.
//

import Foundation
import Parse
import ParseUI

class ProductTableViewController: PFQueryTableViewController {

    let cellIdentifier: String = "Cell"

    override init(style:UITableViewStyle, className: String!)
    {
        super.init(style:style, className: className)
        
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
        self.objectsPerPage = 25
        
        self.parseClassName = className
        
//will change
        self.tableView.rowHeight = 350
//        self.tableView.allowsSelection = false
    }
    
    required init(coder aDecoder: NSCoder)
    {
        fatalError("NSCoding not supported")
    }
    
    
    override func viewDidLoad()
    {
        tableView.registerNib(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        super.viewDidLoad()
    }
    
    override func queryForTable() -> PFQuery {
        var query:PFQuery = PFQuery(className:self.parseClassName!)
        
        if(objects?.count == 0)
        {
            query.cachePolicy = PFCachePolicy.CacheThenNetwork
        }
        
//Change Later
        query.orderByAscending("rating")
        
        return query
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> ProductTableViewCell?
    {
        
        var cell: ProductTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? ProductTableViewCell
        
        if (cell == nil)
        {
            cell = NSBundle.mainBundle().loadNibNamed("ProductTableViewCell", owner: self, options: nil)[0] as? ProductTableViewCell
          /*  PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier) */
        }
        if let pfObject = object
        {
            cell?.productNameLabel?.text = pfObject["name"] as? String
            
            var rating: Double? = pfObject["rating"] as? Double
            if rating == nil
            {
                rating = 0
            }
            
            cell?.productRatingLabel?.text = "\(rating)"
            
            
/* Needs image as url
// Eventually replace with AlamoFire
            cell?.productImageView?.image = nil
            if var urlString: String? = pfObject["url"] as?String
            {
                var url: NSURL? = NSURL(string: urlString!)
            
                if var url: NSURL? = NSURL(string: urlString!)
                {
                    var error: NSError?
                    var request: NSURLRequest = NSURLRequest(URL: url!, cachePolicy: NSURLRequestCachePolicy.ReturnCacheDataElseLoad, timeoutInterval: 5.0)
                    
                    NSOperationQueue.mainQueue().cancelAllOperations()
                    
                    NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler:
                    {
                            (response: NSURLResponse!, imageData: NSData!, error: NSError!) -> Void in
                            
                            cell?.productImageView?.image = UIImage(data: imageData)
                    })
                }
            } */
            
//will add "NIL" image
            var productImage: UIImage? = nil;
            
            let productImageFile = pfObject["image"] as! PFFile
            
            productImageFile.getDataInBackgroundWithBlock { (imageData: NSData?, error: NSError?) -> Void in
                if error == nil
                {
                    if let imageData = imageData
                    {
                        productImage = UIImage(data: imageData)
                    }
                }
                
            }
            cell?.productImageView?.image = productImage
            
        }
        
        return cell
    }
}

