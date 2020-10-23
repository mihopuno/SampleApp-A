//
//  LoginEntities.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/23/20.
//

import Foundation

class UserLogin {
    var mobile : String
    var mpin : String
    
    init(_ mobile : String, _ mpin: String) {
        self.mobile = mobile
        self.mpin = mpin
    }
    
    func toParamaters() -> Parameters {
        let parameters = Parameters()
        return parameters
    }
}

class LoginModel : Codable, NetworkResponse {
    var status: Int
    var message: String
    var data : DataObject<LoginUserModel>?
}

class LoginUserModel : Codable {
    var id : Int
    var firstName : String
    var lastName : String
    var mobile : String
}
