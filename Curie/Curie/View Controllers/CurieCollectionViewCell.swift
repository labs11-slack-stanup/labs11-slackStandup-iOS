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
    
    @IBOutlet var q1Label:UILabel!
    @IBOutlet var q2Label:UILabel!
    @IBOutlet var q3Label:UILabel!
    
    @IBOutlet var a1Field:UITextField!
    @IBOutlet var a2Field:UITextField!
    @IBOutlet var a3Field:UITextField!
    
    private func displaySurvey(){
        guard let survey = survey else {return}
        q1Label.text = survey.question_1
        q2Label.text = survey.question_2
        q3Label.text = survey.question_3
    }
    
    @IBAction func submitSurvey(_ sender: Any) {
        
        
        
    }
    
}
