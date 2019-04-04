//
//  JoinTeamViewController.swift
//  Curie
//
//  Created by Farhan on 4/4/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import UIKit

class JoinTeamViewController: UIViewController {
    
    var userController: UserController?

    @IBOutlet weak var teamCodeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func joinTeam(_ sender: Any) {
    
        guard let teamCode = teamCodeField.text else {return}
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
