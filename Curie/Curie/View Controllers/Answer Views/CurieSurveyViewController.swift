//
//  CurieSurveyViewController.swift
//  Curie
//
//  Created by Farhan on 4/11/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import UIKit

class CurieSurveyViewController: UIViewController {
    
    var userController: UserController?

    @IBOutlet var qLabel: UILabel!
    @IBOutlet var aField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let userController = userController, let user = userController.user else {return}

        userController.loadPossibleCurieSurveys(user: user) { (surveys) in
            guard let surveys = surveys else {return}
            
            for survey in surveys {
                
                
                print(survey.question_1)
                print(survey.question_2)
                print(survey.question_3)
            }
            
        }
        
        // Do any additional setup after loading the view.
    }
    



}
