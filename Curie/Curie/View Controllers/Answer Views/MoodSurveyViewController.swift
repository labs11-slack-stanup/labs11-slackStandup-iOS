
//
//  MoodSurveyViewController.swift
//  Curie
//
//  Created by Farhan on 4/11/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import UIKit

class MoodSurveyViewController: UIViewController {
    
    var userController: UserController?

    @IBOutlet weak var questionStackView: UIStackView!
//    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let userController = userController, let user = userController.user else {return}
        userController.loadPossibleMoodSurveys(user: user) { (surveys) in
            
                
                guard let surveys = surveys else {return}
                
                for survey in surveys {
                    DispatchQueue.main.async {
                    let qlabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                    qlabel.text = survey.description
                    self.questionStackView.addArrangedSubview(qlabel)
//                         now load answer options
                        for answer in survey.answers {
                            
                            let aBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//                            aBtn.titleLabel = answer
                            
                        }
                        
                    }
                }
        }
    }

}
