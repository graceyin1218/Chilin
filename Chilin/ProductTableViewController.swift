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
import UIKit

class ProductTableViewController: UITableViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    let communicator = ParseDBCommunicator()
 
    
    var productsToDisplay: [PFObject]?
    
    @IBOutlet weak var searchBar: UISearchBar!
    
// Initializer

    //either initializer works. (assuming the class name changes accordingly)
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder:aDecoder)
        
/*       let image = UIImage(data: NSData(contentsOfURL: NSURL(string: "http://th01.deviantart.net/fs70/PRE/i/2011/237/b/2/15th_pokemon_anniversary_by_thebionicboi-d47seqk.png")!)!)
        communicator.editProduct("Pokemon", image)  
*/
        
    }
    
    
/*  Initializer if this is a PFQueryTableViewController
    required init(coder aDecoder: NSCoder)
    {
        //It's required...
        super.init(coder: aDecoder)
        
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
        self.objectsPerPage = 25
        self.parseClassName = "Product"
        
        
        productsToDisplay = communicator.getProducts("Pokemon");
        if productsToDisplay != nil
        {
        for product in productsToDisplay!
        {
            println(product["name"])
        }
        }
        else
        {
            println("nil")
        }
    }
*/
    
    override func viewDidLayoutSubviews() {
        var viewbounds = self.view.bounds
        var topBarOffset = self.topLayoutGuide.length
        viewbounds.origin.y = topBarOffset * -1
        self.view.bounds = viewbounds
    }
    
// ViewDidLoad
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = UIRectEdge.None
        
        refresh()
    }
    
    func refresh()
    {
        if !searchBar.text.isEmpty
        {
            var qos = QOS_CLASS_USER_INITIATED
            dispatch_async(dispatch_get_global_queue(Int(qos.value), 0)) { () -> Void in
                var results = self.communicator.getProducts(self.searchBar.text)
                dispatch_async(dispatch_get_main_queue()) { () -> Void in
                    self.productsToDisplay = results
                    self.tableView.reloadData()
                }
            }
        }
    }
/*
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
*/
    
    
// UITableViewDataSource methods
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell // ProductTableViewCell
    {
        var cell: ProductTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ProductTableViewCell
        
        //what happens if we request more rows than we have objects?
        if self.productsToDisplay != nil
        {
            cell.product = self.productsToDisplay![indexPath.row]
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if productsToDisplay == nil
        {
            return 0
        }
        return productsToDisplay!.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    
// UITableViewDelegate methods
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]?
    {
        // bookmark
        // what else?
        return nil
    }
   
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        performSegueWithIdentifier("showProductDetail", sender: tableView.cellForRowAtIndexPath(indexPath))
    }
    
// Prepare for Segue
    //sender is the selected tableviewcell
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showProductDetail"
        {
            // Get new view controller using segue.destinationViewController
            var controller = segue.destinationViewController as! ProductViewController
            
            
            // Pass selected object to new view controller
            controller.product = sender!.product
        }
    }

    
    
    
    

    
// UISearchBarDelegate methods
    
/*    func searchBarTextDidEndEditing(searchBar: UISearchBar)
    {
        refresh()
    }
*/
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        refresh()
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = nil
    }
    
}

