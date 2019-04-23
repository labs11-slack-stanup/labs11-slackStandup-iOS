//
//  OutlinedLabel.swift
//  Curie
//
//  Created by Farhan on 3/28/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import UIKit

class OutlinedLabel: UILabel
{
    override func draw(_ rect: CGRect) {
        let shadowOffset = self.shadowOffset
        let textColor = self.textColor
        
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(1)
//        CGContextSetLineWidth(context, 1)
        context?.setLineJoin(.round)
//        CGContextSetLineJoin(context, CGLineJoin.Round)
        
        context?.setTextDrawingMode(.stroke)
        
//        CGContextSetTextDrawingMode(context, CGTextDrawingMode.Stroke);
        self.textColor = .white
        super.drawText(in: rect)
        
        context?.setTextDrawingMode(.fill)
//        CGContextSetTextDrawingMode(context, CGTextDrawingMode.Fill)
        self.textColor = textColor
        self.shadowOffset = CGSize(width: 0, height: 0)
        super.drawText(in: rect)
        
        self.shadowOffset = shadowOffset
    }
    
}
