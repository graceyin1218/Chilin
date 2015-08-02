//
//  ObedientSplitViewController.swift
//  Chilin
//
//  Created by Grace Yin on 7/26/15.
//  Copyright © 2015 Grace Yin. All rights reserved.
//


//Without this, on compact width devices, the splitViewController will display the detail view first.

import UIKit

class ObedientSplitViewController: UISplitViewController, UISplitViewControllerDelegate {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.delegate = self
        }
        
        func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool{
            return true
        }
        
}