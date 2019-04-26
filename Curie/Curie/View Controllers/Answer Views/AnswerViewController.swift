//
//  AnswerViewController.swift
//  Curie
//
//  Created by Farhan on 3/28/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController, UserControllerContaining {
    
    var userController: UserController?
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var moodContainer: UIView!
    
    @IBOutlet weak var surveyContainer: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setSegmentControlAppearence()
        
        segmentSelected(segmentControl)
        
        setNavigationItem()
        
    }
    
    private func setSegmentControlAppearence() {
        self.segmentControl.layer.cornerRadius = 10.0
        self.segmentControl.layer.borderColor = Colors.darkPeach.cgColor
        self.segmentControl.layer.borderWidth = 1.0
        self.segmentControl.layer.masksToBounds = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
        
         switch sender.selectedSegmentIndex
         {
         case 0 :
            moodContainer.isHidden = false
            surveyContainer.isHidden = true
         case 1:
            moodContainer.isHidden = true
            surveyContainer.isHidden = false
         default:
            break;
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "MoodEmbed") {
            guard let vc = segue.destination  as? MoodSurveyViewController else {return}
            vc.userController = userController
        }
        
        else if (segue.identifier == "CurieEmbed") {
            guard let vc = segue.destination  as? CurieSurveyViewController else {return}
            vc.userController = userController
        }
    }
    

    
}
