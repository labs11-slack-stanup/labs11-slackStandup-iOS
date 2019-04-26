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

extension UIButton {
    func underline() {
        guard let text = self.titleLabel?.text else { return }
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        
        self.setAttributedTitle(attributedString, for: .normal)
    }
}

extension UILabel {
    func underline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}
