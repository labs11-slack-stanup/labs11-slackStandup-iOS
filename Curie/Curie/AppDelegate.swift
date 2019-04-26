//
//  AppDelegate.swift
//  Curie
//
//  Created by Farhan on 3/28/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import UIKit
import Auth0

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().barTintColor = Colors.darkPeach
        
        UINavigationBar.appearance().tintColor = .white
        
        UINavigationBar.appearance().isTranslucent = false
        
        // Override point for customization after application launch.
        
//        window = UIWindow()
//        window?.makeKeyAndVisible()
//
//        let loginVC = LoginViewController
//        let mainVC = AnswerViewController()
//
//        self.window?.rootViewController = SessionManager.tokens == nil ? loginVC : mainVC
//
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        
        return Auth0.resumeAuth(url, options: options)
        
    }


}

