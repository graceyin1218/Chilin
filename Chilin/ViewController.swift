
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

        println("Current User")
        println(PFUser.currentUser())
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var usernameLoginField: UITextField!
    @IBOutlet weak var passwordLoginField: UITextField!
    
    @IBAction func login() {
        var worked = communicator.login(usernameLoginField.text, passwordLoginField.text)
        println(worked)
        if !(worked)
        {
            println("Try again")
        }
        else
        {
            println("Logged in as " + PFUser.currentUser()!.username!)
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ratingField: UITextField!

//remember to clear fields on UI once uploaded
    @IBAction func submitProduct() {
        var worked = communicator.uploadProduct(nameField.text, imageView.image, ratingField.text)
        if worked
        {
            println("Added " + nameField.text)
        }
        else
        {
            println("Failed miserably.")
        }
    }

// NOTE:
    // All Test users have "password" as their password.
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func createUser() {
        var username = usernameField.text
        var password = passwordField.text
        var email = emailField.text
        
        var worked = communicator.createUser(username, password, email)
        
        if !worked
        {
//replace with UI friendly version
            println("Username already taken")
        }
        else
        {
//replace with UI friendly version
            println("Successfully created user: " + username)
        }
    }
    
}

