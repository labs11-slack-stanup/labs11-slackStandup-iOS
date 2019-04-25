
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
    
    var userController: UserController?{
        didSet {
            guard let userController = userController, let user = userController.user else {return}
            
            userController.loadPossibleMoodSurveys(user: user) { (surveys) in

                guard let surveys = surveys else {return}
                    self.moodSurveys = surveys
            }
        }
    }
    
    var moodSurveys: [MoodSurvey]?{
        didSet{
            guard let userController = userController, let moodSurveys = moodSurveys else {return}
            
            let myGroup = DispatchGroup()
            
            for survey in moodSurveys {
                myGroup.enter()
                
                userController.loadSingleMoodSurvey(surveyID: survey.id!) { (completedSurvey) in
                    if let completedSurvey = completedSurvey {
                        survey.answers = completedSurvey.answers
                        print("ID: \(String(describing: survey.id)) Question: \(survey.description)")
                        print("Finished getting: (\(String(describing: completedSurvey.answers))")
                        
                        myGroup.leave()
                    }
                }
                
            }
            
            myGroup.notify(queue: .main) {
                print("Finished all requests.")
                self.collectionView.reloadData()
                DispatchQueue.main.asyncAfter(deadline: .now()+0.25, execute: {
                    self.view.removeBluerLoader()
                    })
                
                }
            
            
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.view.showBlurLoader()
        }
    }
    
    
}

extension MoodSurveyViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let moodSurveys = moodSurveys else {return 0}
        
        return moodSurveys.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier = "MoodyCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MoodCollectionViewCell
        
//        DispatchQueue.main.async {
//            cell.layer.cornerRadius = 10
//        }
        
        guard let survey = moodSurveys?[indexPath.row] else {return UICollectionViewCell()}
        cell.survey = survey
        
        return cell
    }
    
    
    
    
    
    
    
}
