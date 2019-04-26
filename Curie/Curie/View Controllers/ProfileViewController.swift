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
    
    
    @IBOutlet weak var teamName: UILabel!
    
    @IBOutlet weak var managerName: UILabel!
    
    @IBOutlet weak var joinCode: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    var userController: UserController?{
        didSet {
            guard let userController = userController, let user = userController.user, let teamID = user.team_id else {return}
            
            userController.getManagerName(from: teamID) { (manager) in
                if let manager = manager {
                        user.manager = manager
                    }
                }
            }
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationItem()
        
        DispatchQueue.main.async {
            self.setDisplay()
        }
        
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
        
        userController.getTeam(with: user.team_id!) { (teamInfo) in
            if let teamInfo = teamInfo {
                DispatchQueue.main.async {
                    
                    self.teamName.text = teamInfo.first?.name
                    self.joinCode.text = "\(teamInfo.first!.team_code)"
                    
                    self.managerName.text = user.manager
                    self.email.text = user.email
                }
            }
        }
        
        
    
    }
    
    @IBAction func logOut(_ sender: Any) {
        
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
//        UserDefaults.standard.synchronize()
        
        self.navigationController?.popToRootViewController(animated: true)
        
//        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "Login") as! LoginViewController
//
//        let appDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
//
//        appDel.window?.rootViewController = loginVC
//
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
        
        let sms: String = "sms:+7039893933&body=Hello, I have some feedback for Curie: "
        
        UIApplication.shared.open(URL.init(string: sms.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)!, options: [:], completionHandler: nil)
        
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
