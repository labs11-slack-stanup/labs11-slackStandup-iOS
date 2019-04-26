//
//  MoodCollectionViewCell.swift
//  Curie
//
//  Created by Farhan on 4/23/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import UIKit

class MoodCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var qLabel: UILabel!
    @IBOutlet weak var ans1: UIButton!
    @IBOutlet weak var ans2: UIButton!
    @IBOutlet weak var ans3: UIButton!
    @IBOutlet weak var ans4: UIButton!
    
    @IBOutlet weak var surveyTitle: UILabel!
    @IBOutlet weak var surveyDate: UILabel!
    
    let userController = UserController()
    
    
    var survey: MoodSurvey?{
        didSet{
            DispatchQueue.main.async {
                self.displaySurvey()
            }
        }
    }
    
    private func displaySurvey() {
        self.layer.cornerRadius = 10
        
        guard let survey = survey, let answers = survey.answers else {return}
        
        qLabel.text = survey.description
        surveyTitle.text = survey.title
        
        let buttons = [ans1,ans2,ans3,ans4]
       
        for (index, answer) in answers.enumerated(){
            
            buttons[index]?.layer.cornerRadius = 10
            
            let emojiAnswer = ":"+answer.split(separator: ":")[1]+":"
//            print(emojiAnswer)
            
            buttons[index]?.setTitle(emojiAnswer.emojiUnescapedString, for: .normal)
            
//            guard let surveyID = survey.survey_id else {continue}
//
//            buttons[index]?.tag = surveyID
            
            buttons[index]?.addTarget(self, action: #selector(self.answerMoodQuestion), for: .touchUpInside)
            
        }
        
        buttons.forEach { (button) in
            if (button?.layer.cornerRadius)! < CGFloat(10) {
                button?.isHidden = true
            }
        }
        
        surveyDate.text = survey.created_at.split(separator: "T").first?.description
//        surveyDate.text = survey.created_at.split(separator: " ").first?.description
    }
    
    @objc func answerMoodQuestion(sender:UIButton){
        let userController = UserController()
        
        guard let userID = userController.user?.id, let feelingText = sender.titleLabel?.text, let surveyID = survey?.id else {return}
        
        print("UserID = \(userID)")
        print("SurveyID = \(sender.tag)")
        print("Feeling = \(sender.titleLabel?.text)")
        
        userController.answerMoodQuestion(userID: userID, surveyID: surveyID, feeling: feelingText) { (statusResponseCode) in
            
            guard let statusResponseCode = statusResponseCode else {return}
            
            if statusResponseCode == 201 {
                
                print("AnswerSuccessful")
                
            }
        }
    }
    
    
}
