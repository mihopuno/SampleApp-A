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
}
