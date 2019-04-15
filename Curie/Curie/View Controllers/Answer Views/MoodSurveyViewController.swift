
//
//  MoodSurveyViewController.swift
//  Curie
//
//  Created by Farhan on 4/11/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import Emoji
import UIKit

class MoodSurveyViewController: UIViewController {
    
    var userController: UserController?
    var moodSurveys = [MoodSurvey]()
    
    @IBOutlet weak var questionStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let userController = userController, let user = userController.user else {return}
        userController.loadPossibleMoodSurveys(user: user) { (surveys) in
                
                guard let surveys = surveys else {return}
                
                for survey in surveys {
                    guard let surveyID = survey.id else {return}
                    userController.loadSingleMoodSurvey(surveyID: surveyID, completion: { (completeSurvey) in
                        
                        guard let completeSurvey = completeSurvey else {return}
                        DispatchQueue.main.async {
                            self.displaySurvey(survey: completeSurvey)
                        }
                    })
                    
                }
            
//            DispatchQueue.main.async {
//                let submitBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//                submitBtn.titleLabel = "Submit"
//                questionStackView.addArrangedSubview(submitBtn)
//            }
        }
    }
    
    func displaySurvey(survey: MoodSurvey){
            let qlabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            qlabel.text = survey.description
            self.questionStackView.addArrangedSubview(qlabel)
            //                         now load answer options
            
            
            guard let answers = survey.answers else {print("no Answers found"); return;}
            
            for answer in answers {
                
                let aBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 45, height: 60))
                
                let emojiAnswer = ":"+answer.split(separator: ":")[1]+":"
                print(emojiAnswer)
                aBtn.setTitle(emojiAnswer.emojiUnescapedString, for: .normal)
                
                questionStackView.addArrangedSubview(aBtn)
            }
    }
}
