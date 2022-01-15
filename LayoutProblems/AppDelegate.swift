//
//  AppDelegate.swift
//  LayoutProblems
//
//  Created by Logan Melton on 1/15/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.backgroundColor = .systemBackground
    window?.rootViewController = SearchViewController()
    
    return true
  }
}


