//
//  RegisterEntities.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/23/20.
//

import Foundation

class UserRegistration {
    var firstName : String
    var lastName : String
    var mobile : String
    var mpin : String
    
    init(_ firstName : String, _ lastName : String, _ mobile: String, _ mpin: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.mobile = mobile
        self.mpin = mpin
    }
    
    func toParameters() -> Parameters {
        var param = Parameters()
        param["first_name"] = firstName
        param["last_name"] = lastName
        param["mobile"] = mobile
        param["mpin"] = mpin
        return param
    }
}

class RegisterModel : Codable, NetworkResponse {
    var status: Int
    var message: String
    var data : DataObject<UserProfileModel>?
}
