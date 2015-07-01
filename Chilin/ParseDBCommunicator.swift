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

// This is the only class that communicates directly with the Parse Database.


class ParseDBCommunicator {
    
    var username: String?
    var loggedin: Bool

// FIGURE OUT SESSIONS
    
    init ()
    {
        //check for cached user
        
        var currentUser = PFUser.currentUser()
        
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
    
    func createUser(u: String, p: String, e: String) -> (worked: Bool, error: String?)
    {
        var user = PFUser()
        user.username = u
        user.password = p
        user.email = e
        
        var worked = false
        var errorString: String? = nil
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error
            {
                errorString = error.userInfo?["error"] as? String
            }
            else
            {
                worked = true
                self.username = u
                self.loggedin = true
            }
        }
        return (worked, errorString)
    }
    
    func login(username: String, password: String) -> Bool
    {
        var worked: Bool = false
        
        PFUser.logInWithUsernameInBackground(username, password: password) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil
            {
                self.username = username
                self.loggedin = true
                worked = true
            }
            else
            {
                worked = false
            }
        }
        
        return worked
    }
    
// can only change if PFUser is obtained through authenticated means (such as currentUser() )
    
    func changePassword(currentPass: String, newPass: String) -> Bool
    {
        var user = PFUser.currentUser()
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
    
    func changeEmail(newEmail: String) -> Bool
    {
        var user = PFUser.currentUser()
        if user != nil
        {
            user!.email = newEmail
            user!.save()
            return true
        }
        return false

    }
    
    func logout()
    {
        PFUser.logOut()
        username = nil
        loggedin = false
    }
    
    func forgotPassword(username: String) -> Bool
    {
        var query = PFQuery(className: "User")
        query.whereKey("username", equalTo: username)
        
        var worked = false
        var email: String? = nil
        
        query.findObjectsInBackgroundWithBlock {
            (users: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil
            {
                if users != nil && users!.count == 1
                {
                    worked = true
                    var user = users![0] as! PFUser
                    email = user.email
                }
            }
        }
        if worked
        {
            PFUser.requestPasswordResetForEmail(email!)
        }
        
        return worked
    }
    
// Products
    
    func uploadProduct(name: String) -> Bool
    {
        //if name exists, don't create
        
        
        return true
    }
    
    func uploadProduct(name: String, image: UIImage) -> Bool
    {
        uploadProduct(name)
        
        return true
    }
    
    func uploadProduct(name: String, image: UIImage?, rating: String) -> Bool
    {
        
        return true
    }
    
    func uploadImage(image: UIImage) -> Bool
    {
        
        return true
    }
    
    func deleteProduct(name: String) -> Bool
    {
        
    }
    
    
// Comments
    
    //still need to figure out DB representation.
    
}
