//
//  NSAppDelegate.swift
//  Sagar.Enginear.ai_test
//
//  Created by pcq196 on 11/12/19.
//  Copyright © 2019 pcq196. All rights reserved.
//

import UIKit

import UIKit

@UIApplicationMain
class NSAppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    static var share:NSAppDelegate{
        return UIApplication.shared.delegate as! NSAppDelegate
    }
}
