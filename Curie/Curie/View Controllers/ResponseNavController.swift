//
//  ResponseNavController.swift
//  Curie
//
//  Created by Farhan on 4/4/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import UIKit

class ResponseNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.barTintColor = UIColor(red: 2.0/255.0, green: 200.0/255.0, blue: 167.0/255.0, alpha: 1.0)
//        guard let item = self.navigationBar.backItem else {return}
//        item.hidesBackButton = true
//        self.navigationItem.leftBarButtonItem = nil
//        self.navigationItem.leftBarButtonItem?.isEnabled = false
//        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.clear
        // Do any additional setup after loading the view.
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
