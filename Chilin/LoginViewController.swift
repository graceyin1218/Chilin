//
//  LoginViewController.swift
//  Chilin
//
//  Created by Grace Yin on 7/14/15.
//  Copyright (c) 2015 Grace Yin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let communicator = ParseDBCommunicator()
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

//Logging in
    @IBAction func login()
    {
        if usernameField.text == "" || passwordField.text == ""
        {
            displayFailure()
            return
        }
        let worked = communicator.login(usernameField.text!, passwordField.text!)
        if !(worked)
        {
            displayFailure()
            return
        }
        performSegueWithIdentifier("success", sender: self)
    }
    
    func displayFailure()
    {
        passwordField.text = ""
        
        //move down everything below Chilin
        //insert the text field "Username or password did not match our records"
        
        //or in a popup alert.
        
        
        //for now...
        print("failure")
    }
    
    
// create a new account
    @IBAction func createAccount()
    {
        //segue
    }
    
    
// forgot account
    @IBAction func forgotAccount()
    {
        //segue
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "success"
        {
            // write the username in a corner
            return
        }
    }

}
