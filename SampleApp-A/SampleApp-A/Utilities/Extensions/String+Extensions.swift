//
//  String+Extensions.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/23/20.
//

import Foundation

extension String {
    
    public func isPhone()->Bool {
        if self.isAllDigits() == true {
            let phoneRegex = "[09][0-9]{10}" // "[235689][0-9]{6}([0-9]{3})?"
            let predicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return  predicate.evaluate(with: self)
        } else {
            return false
        }
    }

    private func isAllDigits()->Bool {
        let charcterSet  = NSCharacterSet(charactersIn: "0123456789").inverted
        let inputString = self.components(separatedBy: charcterSet)
        let filtered = inputString.joined(separator: "")
        return  self == filtered
    }
}
