//
//  Extention+VC.swift
//  Curie
//
//  Created by Farhan on 4/22/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import UIKit

extension UIViewController {
    func setNavigationItem() {
        let imageView = UIImageView(image: UIImage(named: "miniCurie"))
        self.navigationItem.titleView = imageView
    }
}

extension UINavigationController {
    override open var preferredStatusBarStyle : UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}
