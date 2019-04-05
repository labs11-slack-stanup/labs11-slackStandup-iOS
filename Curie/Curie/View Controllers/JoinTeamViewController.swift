//
//  JoinTeamViewController.swift
//  Curie
//
//  Created by Farhan on 4/4/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import UIKit

class JoinTeamViewController: UIViewController {
    
    var userController: UserController?

    @IBOutlet weak var teamCodeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = userController?.user else {return}
        print(user.id)
    }
    
    @IBAction func joinTeam(_ sender: Any) {
    
        guard let user = userController?.user, let teamCode = teamCodeField.text else {return}
        
        guard let code = Int(teamCode) else {return}
        
        userController?.joinUserTeam(user: user, joinCode: code, completion: { (responseCode) in
           guard let responseCode = responseCode else {return}
            if responseCode >= 200 {
                print("Team Joining Successfull")
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "Joined", sender: self)
                }
            }
        })
        
    }
    
    
    // MARK: - Navigation

     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Joined" {
//            print("Login Successfull")
            guard let destinationVC = segue.destination as? UITabBarController, let nextVC =  destinationVC.children.first as? AnswerViewController else {return}
            
            nextVC.userController = userController
            
        }
    }
 

}
