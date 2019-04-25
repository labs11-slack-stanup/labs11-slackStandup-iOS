//
//  HistoryCollectionViewCell.swift
//  Curie
//
//  Created by Farhan on 4/24/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import UIKit

class HistoryCollectionViewCell: UICollectionViewCell {
    
    var moodAnswer: MoodAnswer? {
        didSet {
            displayCell()
        }
    }
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    func displayCell(){
        
        self.layer.cornerRadius = 10
        
        guard let moodAnswer = moodAnswer else {return}
        
        questionLabel.text = moodAnswer.question
        
        answerLabel.text = moodAnswer.feeling_text
        
        titleLabel.text = moodAnswer.title
        
        dateLabel.text = moodAnswer.created_at.split(separator: "T").first?.description
        
        
    }
    
}
