//
//  UIImageView+Extensions.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/23/20.
//

import UIKit
import Kingfisher

// MARK: - Kingfisher
extension UIImageView {
    
    func setImageWithPath(_ path: String,
                          _ placeholder: UIImage? = UIImage(named: "placeholder")) {
        let url = URL(string: path)
        self.kf.setImage(with: url,
                         placeholder: placeholder)
    }
}
