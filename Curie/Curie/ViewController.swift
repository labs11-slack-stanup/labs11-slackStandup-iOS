//
//  LoginViewController.swift
//  Curie
//
//  Created by Farhan on 3/28/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import UIKit
import Auth0

class LoginViewController: UIViewController {
   
    @IBOutlet weak var signInButton: UIButton!
    
//    Credentials manager
    // Create an instance of the credentials manager for storing credentials
    let credentialsManager = CredentialsManager(authentication: Auth0.authentication())
    
    override func viewDidLoad() {
        signInButton.layer.cornerRadius = 10
    }
    

    @IBAction func signIn(_ sender: Any) {
        
        Auth0
            .webAuth()
            .scope("openid profile offline_access")
            .audience("https://mood-curie.auth0.com/userinfo")
            .start {
                switch $0 {
                case .failure(let error):
                    // Handle the error
                    print("Error: \(error)")
                case .success(let credentials):
                    // Auth0 will automatically dismiss the login page
                    // Store the credentials
                    self.performSegue(withIdentifier: "LoginSuccess", sender: self)
                    self.credentialsManager.store(credentials: credentials)
                    print("Credentials: \(credentials)")
                }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LoginSuccess" {
            print("Login Successfull)")
            guard let destinationVC = segue.destination as? AnswerViewController else {return}
            destinationVC.credentialsManager = credentialsManager
        }
    }
}

