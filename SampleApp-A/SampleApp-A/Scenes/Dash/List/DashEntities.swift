//
//  DashEntities.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/23/20.
//

import Foundation

class Rewards : Codable, NetworkResponse {

    var status : Int
    var message : String
    var data : DataArray<RewardModel>
}

class RewardModel : Codable {
    var id : Int
    var name : String
    var image : String
    var description : String
}

class UserProfileModel : Codable, NetworkResponse {
    var status: Int
    var message: String
    var data : DataObject<UserModel>
}

class UserModel : Codable {
    var id : String
    var firstName : String
    var lastName : String
    var mobile : String
    var isVerified : Bool
    var referralCode : String
    
    var fullName : String {
        return firstName + " " + lastName
    }
}
