//
//  HistoryViewController.swift
//  Curie
//
//  Created by Farhan on 4/5/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UserControllerContaining {
    
    var userController: UserController?{
        didSet{
            guard let userController = userController, let user = userController.user else {return}
            
            userController.loadPossibleMoodSurveys(user: user) { (surveys) in
                guard let surveys = surveys else {return}
                self.completedMoodSurveys = surveys
            }
        }
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    var completedMoodSurveys:[MoodSurvey]?{
        didSet{
         guard let userController = userController, let user = userController.user, let userID = user.id else {return}
            
            userController.fetchMoodAnswers(userID: userID) { (moodAnswers) in
                guard let moodAnswers = moodAnswers else {return}
                
                for answer in moodAnswers {
                    guard let completedMoodSurveys = self.completedMoodSurveys else {return}
                    for survey in completedMoodSurveys {
                        if (answer.survey_id == survey.id){
                            answer.title = survey.title
                            answer.question = survey.description
                        }
                    }
                }
                
                self.completedMoodAnswers = moodAnswers
            }
        }
    }
    
    var completedMoodAnswers:[MoodAnswer]?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItem()
        
//        guard let userController = userController, let user = userController.user else {return}
//
//        userController.loadPossibleMoodSurveys(user: user) { (surveys) in
//            guard let surveys = surveys else {return}
//            self.completedMoodSurveys = surveys
//        }
        
        // Load Curie Content 
        // Do any additional setup after loading the view.
    }

}

extension HistoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let completedMoodAnswers = completedMoodAnswers else {return 0}
        return completedMoodAnswers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HistoryCell", for: indexPath) as! HistoryCollectionViewCell
        
        guard let completedMoodAnswers = completedMoodAnswers else {return UICollectionViewCell()}
        let answer = completedMoodAnswers[indexPath.row]
    
        cell.moodAnswer = answer
       
        return cell
    }
    
}
