//
//  ProfileViewController.swift
//  Curie
//
//  Created by Farhan on 4/5/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UserControllerContaining {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var teamLabel: UILabel!
    
    @IBOutlet weak var feedbackBtn: UIButton!
    
    @IBOutlet weak var logOutBtn: UIButton!
    
    @IBOutlet weak var baseView: UIView!
    
    @IBOutlet weak var teamView: UIView!
    
    @IBOutlet weak var managerView: UIView!
    
    @IBOutlet weak var joinCodeView: UIView!
    
    @IBOutlet weak var emailView: UIView!
    
    var userController: UserController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationItem()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setDisplay() {
        
        guard let userController = userController, let user = userController.user else { return }
        
        feedbackBtn.underline()
        
        welcomeLabel.text = "Welcome, \(user.firstName)"
        
        baseView.layer.cornerRadius = 10
        logOutBtn.layer.cornerRadius = 10
        teamView.layer.cornerRadius = 10
        managerView.layer.cornerRadius = 10
        joinCodeView.layer.cornerRadius = 10
        emailView.layer.cornerRadius = 10
        
        
    
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
    
    
    @IBAction func sendFeedback(_ sender: Any) {
        
        
        
        
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
