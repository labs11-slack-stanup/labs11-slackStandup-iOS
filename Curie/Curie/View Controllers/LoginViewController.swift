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
    
    let userController = UserController()
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    //    Credentials manager
    // Create an instance of the credentials manager for storing credentials
    
    
    override func viewDidLoad() {
        signInButton.layer.cornerRadius = 10
        signUpButton.layer.cornerRadius = 10
    }
    
    
    @IBAction func signIn(_ sender: Any) {
        
        Auth0
            .webAuth()
            .scope("openid profile email")
            .audience("https://mood-curie.auth0.com/userinfo")
            .start {
                switch $0 {
                case .failure(let error):
                    print("Error showing login: \(error)")
                case .success(let credentials):
                    guard let accessToken = credentials.accessToken, let idToken = credentials.idToken else { return }
                    SessionManager.tokens = Tokens(accessToken: accessToken, idToken: idToken)
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "LoginSuccess", sender: self)
                    }
                    
                    SessionManager.retrieveProfile({ (userinfo, error) in
                        if let error = error {
                            print(error)
                        }
                        
                        guard let fname = userinfo?.givenName, let lname = userinfo?.familyName, let email = userinfo?.email else {return}
//
                        let tempUser = User(first: fname , last: lname, email: email)
//
                        self.userController.fetchMoreUserData(user: tempUser, completion: { (user) in
                            if let user = user {
                                self.userController.user = user
                            } 
                        })
                        
//                        print(userinfo?.name)
//                        print(userinfo?.familyName)
//                        print(userinfo?.givenName)
//                        print(userinfo?.email)
                        
                    })
                    
                }
        }
        
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LoginSuccess" {
            print("Login Successfull)")
            guard let destinationVC = segue.destination as? AnswerViewController else {return}
            destinationVC.userController = userController
        }
    }
}

