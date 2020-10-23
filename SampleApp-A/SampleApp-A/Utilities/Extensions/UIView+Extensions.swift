//
//  UIView+Extensions.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/22/20.
//

import UIKit

extension UIView {
    
    func addCornerRadius(_ radius : CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    func addBorder(_ width : CGFloat, color : UIColor){
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        self.layer.masksToBounds = true
    }
    
    func elevate(elevation: Double) {
       self.layer.masksToBounds = false
       self.layer.shadowColor = UIColor.black.cgColor
       self.layer.shadowOffset = CGSize(width: 0, height: elevation)
       self.layer.shadowRadius = abs(CGFloat(elevation))
       self.layer.shadowOpacity = 0.24
    }
}
