
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
        DispatchQueue.main.async {
            self.view.showBlurLoader()
        }
        

        guard let userController = userController, let user = userController.user else {return}
        userController.loadPossibleMoodSurveys(user: user) { (surveys) in
                
                guard let surveys = surveys else {return}
                
                for survey in surveys {
                    guard let surveyID = survey.id else {return}
                    userController.loadSingleMoodSurvey(surveyID: surveyID, completion: { (completeSurvey) in
                        
                        guard let completeSurvey = completeSurvey else {return}
                        DispatchQueue.main.async {
                            self.displaySurvey(survey: completeSurvey)
                            self.view.removeBluerLoader()
                        }
                    })
                    
                }
        }
    }
    
    func displaySurvey(survey: MoodSurvey){
            let qlabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            qlabel.text = survey.description
            self.questionStackView.addArrangedSubview(qlabel)
            
            guard let answers = survey.answers else {print("no Answers found"); return;}
            let answerStackView = UIStackView()
            answerStackView.alignment = .fill
            answerStackView.axis = .horizontal
            answerStackView.spacing = 8
            for answer in answers {
                
                let aBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 45, height: 60))
                
                let emojiAnswer = ":"+answer.split(separator: ":")[1]+":"
                print(emojiAnswer)
                
                aBtn.setTitle(emojiAnswer.emojiUnescapedString, for: .normal)
                aBtn.titleLabel?.adjustsFontSizeToFitWidth = true
                
                answerStackView.addArrangedSubview(aBtn)
            }
        
            questionStackView.addArrangedSubview(answerStackView)
    }
    
    
}
