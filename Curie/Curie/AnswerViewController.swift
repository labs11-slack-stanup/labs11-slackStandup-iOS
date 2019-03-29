//
//  AnswerViewController.swift
//  Curie
//
//  Created by Farhan on 3/28/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import UIKit
import Auth0

class AnswerViewController: UIViewController {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    var credentialsManager: CredentialsManager?
//    var profile: UserInfo?{
//        didSet{
//            print(profile?.name)
//        }
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        var accessToken = ""
        
        credentialsManager?.credentials { error, credentials in
            guard error == nil, let credentials = credentials else {
                return print("Failed with \(error)")
            }
            accessToken = credentials.accessToken!
            print(accessToken)
            print("Obtained credentials: \(credentials)")
        }
        
        Auth0
            .authentication()
            .userInfo(withAccessToken: accessToken)
            .start { result in
                switch result {
                case .success(let profile):
                    print("User Profile: \(profile)")
                case .failure(let error):
                    print("Failed with \(error)")
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        guard let credentialsManager = credentialsManager else {return}
//
//        credentialsManager.credentials { error, credentials in
//            guard error == nil, let credentials = credentials else {
//                // Handle error
//                print("Error: \(error)")
//                return
//            }
//
//            guard let accessToken = credentials.accessToken else {
//                print("ACCESS TOKEN MISSING")
//                return
//            }
//
//
//            Auth0
//                .authentication()
//                .userInfo(withAccessToken: accessToken)
//                .start { result in
//                    switch(result) {
//                    case .success(let profile):
//                        self.profile = profile
//                        print(profile)
//                        // You've got the user's profile, good time to store it locally.
//                    // e.g. self.profile = profile
//                    case .failure(let error):
//                        // Handle the error
//                        print("Error: \(error)")
//                    }
//            }
        
//        }
        
    }
}
