//
//  AnswerViewController.swift
//  Curie
//
//  Created by Farhan on 3/28/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    @IBOutlet var lblsuccess:UILabel!
    var userController: UserController?
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.leftBarButtonItem?.isEnabled = false
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.clear
        
        guard let userController = userController else {return}
        
        guard let name = userController.user?.firstName, let type = userController.user?.type else {return}
        
        lblsuccess.text = "Name:\(name) \nType:\(type)"
    }

    
}
