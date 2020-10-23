//
//  LoginViewModel.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/23/20.
//

import Foundation

class LoginViewModel {
    
    private var delegate : LoginViewDelegate?
    
    init(_ delegate: LoginViewDelegate) {
        self.delegate = delegate
    }
    
    func userLoginAndValidate(_ mobile: String, _ password: String) {
        let passwordIsValid = password.count == 4
        let mobileIsValid = mobile.isPhone()
        let valid = passwordIsValid && mobileIsValid
        if valid {
            loginUser(UserLogin(mobile, password))
        } else {
            delegate?.onLoginCredentialsInvalid("Invalid mobile number or MPIN code")
        }
    }
    
    func loginUser(_ login: UserLogin) {
        NetworkRequest.shared.request(type: APIRoutes.Welcome.userLogin(login)) { (result) in
            switch result {
            case .success(_):
                self.delegate?.onLoginRequestSuccess()
                break
            case .failure(let error):
                self.delegate?.onLoginRequestFailed(error)
                break
            }
        }
    }
}
