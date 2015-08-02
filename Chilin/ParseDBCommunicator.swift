//
//  ParseDBCommunicator.swift
//  Chilin
//
//  Created by Grace Yin on 6/30/15.
//  Copyright (c) 2015 Grace Yin. All rights reserved.
//

import Foundation
import UIKit
import Parse
import ParseUI
import Bolts

// This is the only class that communicates directly with the Parse Database.
//with a few exceptions... (image handling in ProductTableViewCell)

// remember:
    // UTC TIMEZONE

class ParseDBCommunicator {
    
    var username: String?
    var loggedin: Bool

// FIGURE OUT SESSIONS
    
    init()
    {
        Parse.setApplicationId("6NwZR4cwIpBICOO0bTwJNk9PfeKF2ka7o4Y6kxPf", clientKey: "8EKgXfp9RS7ZcqNmc3I0NX2Sr2fg9ANJaHtCSulQ")
        
        //check for cached user
        
        let currentUser = PFUser.currentUser()
        
        if currentUser == nil
        {
            loggedin = false
            username = nil
        }
        else
        {
            self.username = currentUser!.username
            loggedin = true
        }
    }
    
// Users
    
    func createUser(u: String, _ p: String, _ e: String) -> Bool
    {
        let user = PFUser()
        user.username = u
        user.password = p
        user.email = e
        
        let worked = user.signUp()
        
        return worked
    }
    
    func login(username: String, _ password: String) -> Bool
    {
        let person = PFUser.logInWithUsername(username, password: password)
        
        if person == nil
        {
            return false
        }
        
        return true
    }
    
// can only change if PFUser is obtained through authenticated means (such as currentUser() )
//TEST
    func changePassword(currentPass: String, _ newPass: String) -> Bool
    {
        let user = PFUser.currentUser()
        if user != nil
        {
            if user!.password != currentPass
            {
                return false
            }
        
            user!.password = newPass
            user!.save()
            return true
        }
        return false
    }
//TEST
    func changeEmail(newEmail: String) -> Bool
    {
        let user = PFUser.currentUser()
        if user != nil
        {
            user!.email = newEmail
            user!.save()
            return true
        }
        return false

    }
//TEST (though I doubt there'll be any issues)
    func logout()
    {
        PFUser.logOut()
        username = nil
        loggedin = false
    }
    
    
    
    func usernameExists(username: String) -> Bool
    {
        let query = PFQuery(className: "User")
        query.whereKey("username", equalTo: username)
        
        let users = query.findObjects()
        
        if users == nil || users!.count == 0
        {
            return false
        }
        return true
    }
    
    func emailExists(email: String) -> Bool
    {
        let query = PFQuery(className: "User")
        query.whereKey("email", equalTo: email)
        
        let users = query.findObjects()
        
        if users == nil || users!.count == 0
        {
            return false
        }
        return true
    }
    
    
    
//TEST
    func requestPasswordResetForUsername(username: String) -> Bool
    {
        let query = PFQuery(className: "User")
        query.whereKey("username", equalTo: username)
        
        
        let users = query.findObjects()
        
        if users == nil || users!.count != 1
        {
            return false
        }
        PFUser.requestPasswordResetForEmail(users![0].email!!)
        
        return true
    }
    
//Test
    func requestPasswordResetForEmail(email: String) -> Bool
    {
        return PFUser.requestPasswordResetForEmail(email)
    }
    
    
// Products
    //need to be logged in to upload, edit, or delete product.
    
    var currentRequestName: String? = nil

    func uploadProduct(name: String, _ image: UIImage?, _ description: String?) -> Bool
    {
        currentRequestName = name
        
        //if name exists, don't create
        let query = PFQuery(className: "Products")
        query.whereKey("name", equalTo: name)
        
        var objects = query.findObjects()
            
        if objects == nil || objects!.count != 0
        {
            return false
        }
        
        var newObject = PFObject(className: "Products")
        
        newObject["name"] = name
        newObject["creator"] = PFUser.currentUser()
        
        if let image = image
        {
            let imageData = NSData(data: UIImageJPEGRepresentation(image, 1)!)
            newObject["image"] = PFFile(data: imageData)
        }
        if let description = description
        {
            newObject["description"] = description
        }
        
        newObject.saveInBackground()

        return true
    }
    
// enable description/comment editing later
    //figure out how to get this to return the proper bool value (make it synchronous?)
    func editProduct(name: String, _ image: UIImage?) -> Bool
    {
        let query = PFQuery(className: "Products")
        query.whereKey("name", equalTo: name)
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            print(objects!.count)
            if (error != nil)
            {
                return
            }
            if (objects == nil)
            {
                return
            }
            let product = objects![0] as! PFObject
            if image != nil
            {
                let data = NSData(data: UIImageJPEGRepresentation(image!, 1)!)
                product["image"] = PFFile(data: data)
            }
            product.saveInBackground()
        }
        
        return true
    }
    
//TEST
    func getProduct(name: String) -> PFObject?
    {
        currentRequestName = name
        
        let qos = QOS_CLASS_USER_INITIATED
        dispatch_async(dispatch_get_global_queue(qos, 0)) {() -> Void in
        
            let query = PFQuery(className: "Products")
            query.whereKey("name", equalTo: name)
            query.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]?, error: NSError?) -> Void in
                print(objects!.count)
                if (error != nil)
                {
                    return
                }
                if (objects == nil)
                {
                    return
                }
            
                //Should only be one object in objects
                let product = objects![0] as! PFObject
/*                var productImage = product["image"] as? PFFile
                
                if let productImage = productImage
                {
                    productImage.getDataInBackgroundWithBlock{
                        (imageData: NSData?, error: NSError?) -> Void in
                        if error == nil{
                            if let imageData = imageData
                            {
                                image = UIImage(data: imageData)
                            }
                        }
                    }
                }
                var rating: String? = nil
                
                var r: Double? = product["rating"] as? Double
                if r != nil
                {
                    rating = "/(r)"
                }
                dispatch_async(dispatch_get_main_queue()) {
                    if (name != self.currentRequestName)
                    {
                        image = nil
                        rating = nil
                    }
                }
*/
                dispatch_async(dispatch_get_main_queue()) {
                    return product
                }
            }
        }
        return nil
    }


//Returns array of PFObjects that "fit" the query
    //guaranteed that the query is something. (not nil or "")
    //will be performed off the Main Queue.
    
    func getProducts(search: String) -> [PFObject]?
    {
        
        let query = PFQuery(className: "Products")
//Will improve searching later
        query.whereKey("name", containsString: search)
        
        var objects = query.findObjects()
        
        if objects == nil || objects!.count == 0
        {
            return nil
        }
        
        return objects as? [PFObject]
    }
    
    
    func deleteProduct(name: String) -> Bool
    {
        return true
    }
    
    
// Comments
    
    //still need to figure out DB representation.
    //Use Pointers from Products to Commments and the other way around.
    
}
