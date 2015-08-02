//
//  CustomizedNavigationViewController.swift
//  Chilin
//
//  Created by Grace Yin on 7/16/15.
//  Copyright © 2015 Grace Yin. All rights reserved.
//

import UIKit

class CustomizedNavigationViewController: UINavigationController {

    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
    
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "createProduct")
            
        navigationItem.rightBarButtonItem = addButton
        
        //let backButton = UIBarButtonItem(barButtonSystemItem: .Back, target: self, action: "unwind")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
