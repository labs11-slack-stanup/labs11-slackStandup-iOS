//
//  ProfileViewController.swift
//  Curie
//
//  Created by Farhan on 4/5/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UserControllerContaining {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var teamLabel: UILabel!
    
    
    var userController: UserController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let userController = userController, let user = userController.user else { return }
        
        nameLabel.text = user.firstName
        emailLabel.text = user.email
//        teamLabel.text = String(user.team_id) ?? "20"
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOut(_ sender: Any) {
        
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
//        UserDefaults.standard.synchronize()
        
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        
        let appDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDel.window?.rootViewController = loginVC
        
//        let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let initialViewControlleripad : UIViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "Login") as UIViewController
//
//        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
//
//        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
//        appDelegate.window?.rootViewController = initialViewControlleripad
//        appDelegate.window?.makeKeyAndVisible()
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
