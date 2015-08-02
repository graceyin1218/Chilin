//
//  ForgotViewController.swift
//  Chilin
//
//  Created by Grace Yin on 7/14/15.
//  Copyright © 2015 Grace Yin. All rights reserved.
//

import UIKit

class ForgotViewController: UIViewController {


    let communicator = ParseDBCommunicator()
    
    @IBOutlet weak var emailField: UITextField!
    
    
    
    @IBAction func submit()
    {
        if emailField.text == nil || emailField.text! == ""
        {
            displayError()
        }
        if !communicator.emailExists(emailField.text!)
        {
            displayError()
        }
        let worked = communicator.requestPasswordResetForEmail(emailField.text!)
        if !worked
        {
            //when would this not work? 
            //if the email address was not found?
        }
        else
        {
            print("success")
            performSegueWithIdentifier("foundEmail", sender: self)
        }
    }


    func displayError()
    {
        //popup alert
        
        //for now..
        print("email not found")
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "foundEmail"
        {
            //any customization of the next storyboard?
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
