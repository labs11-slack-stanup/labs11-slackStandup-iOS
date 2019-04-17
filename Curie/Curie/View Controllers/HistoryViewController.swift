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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0 // your number of cell here
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
    
    
    
}
