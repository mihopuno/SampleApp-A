//
//  DashEntities.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/23/20.
//

import Foundation

class DataArray<T : Codable> : Codable {
    let list: [T]
}

class DataObject<T : Codable> : Codable {
    let user : T
}

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
    var id : Int
    var firstName : String
    var lastName : String
    var mobile : String
    var isVerified : Bool
    var referralCode : String
}
