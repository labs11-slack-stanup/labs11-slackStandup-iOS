//
//  CurieCollectionViewCell.swift
//  Curie
//
//  Created by Farhan on 4/17/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import UIKit

class CurieCollectionViewCell: UICollectionViewCell {
    
    var survey: CurieSurvey?{
        didSet{
            DispatchQueue.main.async {
                self.displaySurvey()
            }
        }
    }
    
    @IBOutlet weak var q1Label:UILabel!
    @IBOutlet weak var q2Label:UILabel!
    @IBOutlet weak var q3Label:UILabel!
    
    @IBOutlet weak var a1Field:UITextField!
    @IBOutlet weak var a2Field:UITextField!
    @IBOutlet weak var a3Field:UITextField!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var submitBtn: UIButton!
    
    private func displaySurvey(){
        guard let survey = survey else {return}
        
        self.layer.cornerRadius = 12
        submitBtn.layer.cornerRadius = 10
        
        titleLabel.text = survey.title
        
        q1Label.text = survey.question_1
        q2Label.text = survey.question_2
        q3Label.text = survey.question_3
        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
//        guard let date = dateFormatter.date(from: survey.created_at) else {return}
//        dateFormatter.dateStyle = .short
//        dateLabel.text = dateFormatter.string(from: date)

        dateLabel.text = survey.created_at.split(separator: " ").first?.description
        
    }
    
    @IBAction func submitSurvey(_ sender: Any) {
        
        
        
    }
    
}
