//
//  HistoryViewController.swift
//  Curie
//
//  Created by Farhan on 4/5/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UserControllerContaining {
    
    var userController: UserController?

    @IBOutlet weak var tableView: UITableView!
    var completedMoodSurveys:[MoodSurvey]?{
        didSet{
         guard let userController = userController, let user = userController.user, let userID = user.id else {return}
            
            userController.fetchMoodAnswers(userID: userID) { (moodAnswers) in
                guard let moodAnswers = moodAnswers else {return}
                
                for answer in moodAnswers {
                    guard let completedMoodSurveys = self.completedMoodSurveys else {return}
                    for survey in completedMoodSurveys {
                        if (answer.survey_id == survey.id){
                            answer.question = survey.description
                        }
                    }
                }
                
                self.completedMoodAnswers = moodAnswers
            }
        }
    }
    
    var completedMoodAnswers:[MoodAnswer]?{
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let userController = userController, let user = userController.user else {return}
            
        userController.loadPossibleMoodSurveys(user: user) { (surveys) in
            guard let surveys = surveys else {return}
            self.completedMoodSurveys = surveys
        }
        
        // Load Curie Content 
        // Do any additional setup after loading the view.
    }

}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let completedMoodAnswers = completedMoodAnswers else {return 0}
        return completedMoodAnswers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell", for: indexPath)
       
        guard let completedMoodAnswers = completedMoodAnswers else {return UITableViewCell()}
        let answer = completedMoodAnswers[indexPath.row]
        
        DispatchQueue.main.async {
            cell.textLabel?.text = answer.question
            cell.detailTextLabel?.text = answer.feeling_text
        }
        
        return cell
    }
    
    
    
    
    
    
}
