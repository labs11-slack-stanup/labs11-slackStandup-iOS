//
//  ViewController.swift
//  Curie
//
//  Created by Farhan on 3/28/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import UIKit
import Auth0

class ViewController: UIViewController {
    
   
    @IBOutlet weak var signInButton: UIButton!
    

    @IBAction func signIn(_ sender: Any) {
        
        Auth0
            .webAuth()
            .scope("openid profile")
            .audience("https://mood-curie.auth0.com/userinfo")
            .start {
                switch $0 {
                case .failure(let error):
                    // Handle the error
                    print("Error: \(error)")
                case .success(let credentials):
                    // Do something with credentials e.g.: save them.
                    // Auth0 will automatically dismiss the login page
                    print("Credentials: \(credentials)")
                }
        }
    
    }
}

