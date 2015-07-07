//
//  AppDelegate.swift
//  Chilin
//
//  Created by Grace Yin on 6/29/15.
//  Copyright (c) 2015 Grace Yin. All rights reserved.
//

import UIKit
import Parse
import Bolts

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //Parse.enableLocalDatastore()
//        Parse.setApplicationId("6NwZR4cwIpBICOO0bTwJNk9PfeKF2ka7o4Y6kxPf", clientKey: "8EKgXfp9RS7ZcqNmc3I0NX2Sr2fg9ANJaHtCSulQ")

/*
        
//will change
        var tableVC: ProductTableViewController = ProductTableViewController(className: "Products")
        tableVC.title = "Products"
        
//will change
        UINavigationBar.appearance().tintColor = UIColor(red: 0.05, green: 0.47, blue: 0.91, alpha: 1.0)
        UINavigationBar.appearance().barTintColor = UIColor(red: 0.05, green: 0.47, blue: 0.91, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        var navigationVC: UINavigationController = UINavigationController(rootViewController: tableVC)
        
        let frame = UIScreen.mainScreen().bounds
        window = UIWindow(frame: frame)
        
        window!.rootViewController = navigationVC
        window!.makeKeyAndVisible()
        
*/
        println("app did launch")

        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

