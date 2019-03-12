//
//  AppDelegate.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 28/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.backgroundColor = UIColor.white
    
    let loginViewController = LoginViewController()
    
    self.window?.rootViewController = loginViewController
    
    self.window?.makeKeyAndVisible()
    
    AppearanceProxyHelper.customizeNavigationBar()
    
    return true
  }
}

