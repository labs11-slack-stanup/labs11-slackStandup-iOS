//
//  AnswerViewController.swift
//  Curie
//
//  Created by Farhan on 3/28/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    var userController: UserController?
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var moodContainer: UIView!
    
    @IBOutlet weak var surveyContainer: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        segmentSelected(segmentControl)
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
    

    
}
