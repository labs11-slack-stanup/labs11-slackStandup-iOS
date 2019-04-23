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
        
        guard let survey = survey else {return}
        
        qLabel.text = survey.description
        ans1.titleLabel?.text = survey.answers?[0]
        ans2.titleLabel?.text = survey.answers?[1]
        ans3.titleLabel?.text = survey.answers?[2]
        ans4.titleLabel?.text = survey.answers?[3]
        
        surveyTitle.text = survey.title
        
//        let dateFormat = DateFormatter()
//        dateFormat.setLocalizedDateFormatFromTemplate("yyyy-MM-dd'T'HH:mm:ssz")
//        let date = dateFormat.date(from: survey.created_at)!
//        let dateStr = beautifyDate(date)
        surveyDate.text = "04/23/2019"
        
    }
    
    private func beautifyDate(_ date: Date) -> String {
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM d, h:mm a"
        
        return dateFormatterPrint.string(from: date)
        
    }
    
}
