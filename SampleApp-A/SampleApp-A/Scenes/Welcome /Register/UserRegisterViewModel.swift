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
    private var delegate: UserRegisterView?
    
    var isDataInputValid : Bool {
        return isFirstNameValid && isLastNameValid && isMobileNumberValid && isMPINValid
    }
    
    init(_ delegate: UserRegisterView) {
        isFirstNameValid = false
        isLastNameValid = false
        isMobileNumberValid = false
        isMPINValid = false
        self.delegate = delegate
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
        guard number.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
            isMobileNumberValid = false
            method("Mobile number is required")
            return
        }
        let isValid = number.isPhone()
        method(isValid ? nil : "Mobile number is invalid format")
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
    
    func registerAccount(_ firstName: String, _ lastName: String, _ mpin: String, _ mobile: String) {
        let model = UserRegistration(firstName, lastName, mobile, mpin)
        NetworkRequest.shared.request(type: APIRoutes.Welcome.userRegister(model)) { (result) in
            switch result {
            case .success(_):
                self.delegate?.onUserRegistrationSuccess()
                break
            case .failure(let errorModel):
                self.delegate?.onUserRegistrationFailed(errorModel)
                break
            }
        }
    }
}
