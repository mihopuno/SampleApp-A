//
//  UserRegisterViewModel.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/23/20.
//

import UIKit

class UserRegisterViewModel {
    
    private var isFirstNameValid : Bool
    private var isLastNameValid : Bool
    private var isMobileNumberValid : Bool
    private var isMPINValid : Bool
    
    var isDataInputValid : Bool {
        return isFirstNameValid && isLastNameValid && isMobileNumberValid && isMPINValid
    }
    
    init() {
        isFirstNameValid = false
        isLastNameValid = false
        isMobileNumberValid = false
        isMPINValid = false
    }
    
    
    func validateFirstName(_ method : (_ errorMessage: String?)->(), _ firstName : String) {
        let isValid = firstName.trimmingCharacters(in: .whitespacesAndNewlines) != ""
        method(isValid ? nil : "First name is required")
        isFirstNameValid = isValid
    }
    
    func validateLastName(_ method : (_ errorMessage: String?)->(), _ lastName : String) {
        let isValid = lastName.trimmingCharacters(in: .whitespacesAndNewlines) != ""
        method(isValid ? nil : "Last name is required")
        isLastNameValid = isValid
    }
    
    func validateMobileNumber(_ method : (_ errorMessage: String?)->(), _ number : String) {
        let isValid = number.isPhone()
        method(isValid ? nil : "Mobile number is required")
        isMobileNumberValid = isValid
    }
    
    func validateMPIN(_ methodMPIN : (_ errorMPINMessage: String?)->(),
                      _ methodCMPIN : (_ errorMPINMessage: String?)->(),
                      _ mpin : String, _ cmpin : String) {
        let isValid = mpin == cmpin && mpin != "" && cmpin != ""
        let errorMessage = isValid ? nil : "MPIN is not match"
        methodMPIN(errorMessage)
        methodCMPIN(errorMessage)
        isMPINValid = isValid
    }
}
