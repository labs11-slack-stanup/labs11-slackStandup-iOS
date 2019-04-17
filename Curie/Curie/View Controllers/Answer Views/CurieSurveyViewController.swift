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
    
    @IBOutlet weak var fieldsStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let userController = userController, let user = userController.user else {return}

        userController.loadPossibleCurieSurveys(user: user) { (surveys) in
            guard let surveys = surveys else {return}
            
            for survey in surveys {
                DispatchQueue.main.async {
                    let qlbl1 = UILabel()
                    qlbl1.text = survey.question_1
                    let albl1 = UITextField()
                    self.fieldsStackView.addArrangedSubview(qlbl1)
                    self.fieldsStackView.addArrangedSubview(albl1)
                    
                    let qlbl2 = UILabel()
                    qlbl2.text = survey.question_2
                    let albl2 = UITextField()
                    self.fieldsStackView.addArrangedSubview(qlbl2)
                    self.fieldsStackView.addArrangedSubview(albl2)
                    
                    let qlbl3 = UILabel()
                    qlbl3.text = survey.question_3
                    let albl3 = UITextField()
                    self.fieldsStackView.addArrangedSubview(qlbl3)
                    self.fieldsStackView.addArrangedSubview(albl3)
                    
                    print(survey.question_1)
                    print(survey.question_2)
                    print(survey.question_3)
                }
                
            }
            
        }
        
        // Do any additional setup after loading the view.
    }
    



}
