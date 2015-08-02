//
//  UploadViewController.swift
//  Chilin
//
//  Created by Grace Yin on 7/8/15.
//  Copyright (c) 2015 Grace Yin. All rights reserved.
//

import Foundation
import UIKit
import Parse
import ParseUI

class UploadViewController: UIViewController {
    
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var descriptionField: UITextView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func tappedImage(sender: UITapGestureRecognizer) {
        //create imageViewController segue
        //let user choose between uploading from album or taking a new photo
        //then upload the image.
        performSegueWithIdentifier("showImageSelector", sender: self)
    }
    @IBOutlet var tapRecognizer: UITapGestureRecognizer!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //picker.delegate = self
        
        tapRecognizer.addTarget(self, action: "tappedImage:")
        
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(tapRecognizer)
        
        descriptionField.layer.borderColor = UIColor.lightGrayColor().CGColor
        descriptionField.layer.borderWidth = 1.0
        descriptionField.layer.cornerRadius = 8
    }
    
// Upload to Database
    @IBAction func upload()
    {
        let communicator = ParseDBCommunicator()
        
        if nameField.text == nil
        {
            //send user a fail message
            return
        }
        
        communicator.uploadProduct(nameField.text!, imageView.image, descriptionField.text)
    }

// Segue to Image Selector
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "showImageSelector"
        {
            let vc = segue.destinationViewController as? ImageSelectorViewController
            if imageView.image != nil
            {
                vc!.previouslySelectedImage = self.imageView.image
            }
        }
    }
    
// Segue from Image Selector
    
    @IBAction func unwindToUploadView(segue: UIStoryboardSegue)
    {
        let imageSelectorViewController = segue.sourceViewController as? ImageSelectorViewController
        imageView.image = imageSelectorViewController?.imageView.image
        imageView.setNeedsDisplay()
    }
}
