//
//  NewAccountViewController.swift
//  Chilin
//
//  Created by Grace Yin on 7/14/15.
//  Copyright © 2015 Grace Yin. All rights reserved.
//

import UIKit

class NewAccountViewController: UIViewController {

    
    let communicator = ParseDBCommunicator()
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var verifyPasswordField: UITextField!
    

    //only one of these will ever be displayed after a given attempt.
    func displayNoUsername()
    {
        print("enter a username")
    }
    func displayNoEmail()
    {
        print("enter an email address")
    }
    func displayNoPassword()
    {
        print("enter a password, dummy")
    }
    func displayUsernameFailure()
    {
        print("username already taken")
    }
    func displayEmailFailure()
    {
        print("email already used")
    }
    func displayPasswordFailure()
    {
        //print at the bottom of the screen "passwords don't match"
        
        //for now..
        print("passwords don't match")
    }
    
    @IBAction func signUp()
    {
        //check if username exists
        if usernameField.text == nil || usernameField.text! == ""
        {
            displayNoUsername()
            return
        }
        
        if communicator.usernameExists(usernameField.text!)
        {
            displayUsernameFailure()
            return
        }
            
        
        //check if email exists
        
        if emailField.text == nil || emailField.text! == ""
        {
            displayNoEmail()
            return
        }
        
        if communicator.emailExists(emailField.text!)
        {
            displayEmailFailure()
            return
        }
        
        
        //verify passwords match
                //is there a way to avoid the Pyramid of Doom?
        
        if passwordField.text != nil && passwordField.text! != ""
        {
            if verifyPasswordField.text != nil && verifyPasswordField.text! != ""
            {
                if verifyPasswordField.text != passwordField.text
                {
                    displayPasswordFailure()
                    return
                }
            }
        }
        else
        {
            displayNoPassword()
            return
        }
        
        
        //sign up
        
        communicator.createUser(usernameField.text!, passwordField.text!, emailField.text!)
        
        performSegueWithIdentifier("success", sender: self)
    }
        

        
        
        

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        if segue.identifier == "success"
        {
            
        }
        
        
    }


}
