
//
//  ViewController.swift
//  Chilin
//
//  Created by Grace Yin on 6/29/15.
//  Copyright (c) 2015 Grace Yin. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    let communicator = ParseDBCommunicator()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Current User")
        print(PFUser.currentUser())
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var usernameLoginField: UITextField!
    @IBOutlet weak var passwordLoginField: UITextField!
    
    @IBAction func login() {
        if usernameLoginField.text == nil || passwordLoginField.text == nil
        {
            return
        }
        
        let worked = communicator.login(usernameLoginField.text!, passwordLoginField.text!)
        print(worked)
        if !(worked)
        {
            print("Try again")
        }
        else
        {
            print("Logged in as " + PFUser.currentUser()!.username!)
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ratingField: UITextField!

//remember to clear fields on UI once uploaded
    @IBAction func submitProduct() {
        if nameField.text == nil
        {
            print("No Name")
            return
        }
        let worked = communicator.uploadProduct(nameField.text!, imageView.image, ratingField.text)
        if worked
        {
            print("Added " + nameField.text!)
        }
        else
        {
            print("Failed miserably.")
        }
    }

// NOTE:
    // All Test users have "password" as their password.
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func createUser() {
        let username = usernameField.text
        let password = passwordField.text
        let email = emailField.text
        
        if username == nil || password == nil || email == nil
        {
            print("Something's nil")
            return
        }
        
        let worked = communicator.createUser(username!, password!, email!)
        
        if !worked
        {
//replace with UI friendly version
            print("Username already taken")
        }
        else
        {
//replace with UI friendly version
            print("Successfully created user: " + username!)
        }
    }
    
}

