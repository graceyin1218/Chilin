//
//  ImageSelectorViewController.swift
//  Chilin
//
//  Created by Grace Yin on 7/9/15.
//  Copyright (c) 2015 Grace Yin. All rights reserved.
//

import UIKit

class ImageSelectorViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    
    @IBOutlet weak var imageView: UIImageView!
    
    var previouslySelectedImage: UIImage?
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad()
    {
        imageView.image = previouslySelectedImage
        picker.delegate = self
    }
    
    
    @IBAction func fromAlbum(sender: UIBarButtonItem)
    {
        picker.allowsEditing = false
        picker.sourceType = .PhotoLibrary
        
        picker.modalPresentationStyle = .Popover
        presentViewController(picker, animated: true, completion: nil)
        picker.popoverPresentationController?.barButtonItem = sender
    }
    
    @IBAction func newPhoto(sender: UIBarButtonItem) //doesn't need the sender parameter
    {
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil
        {
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            picker.cameraCaptureMode = .Photo
            presentViewController(picker, animated: true, completion: nil)
        }
        else
        {
            let alertVC = UIAlertController(title: "No Camera", message: "Sorry, this device doesn't have a camera", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertVC.addAction(okAction)
            presentViewController(alertVC, animated: true, completion: nil)
        }
        
    }

// might need this?
/*
    @IBAction func done(sender: AnyObject)
    {
        performSegueWithIdentifier("unwindToUploadView")
    }
*/

    
// ImagePicker delegates
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject: AnyObject])
    {
        println("did finish picking media with info")
        var image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.contentMode = .ScaleAspectFit
        imageView.image = image
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController)
    {
        println("did cancel")
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
