//
//  AppGenericProtocols.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/23/20.
//

import Foundation

protocol NetworkResponse {
    var status : Int { get set }
    var message : String { get set }
}

class ErrorModel : Error {
    
    var statusCode : Int?
    var message : String
    
    init(_ code: Int?, _ message: String) {
        self.statusCode = code
        self.message = message
    }
    
    convenience init(_ error: Error, _ code: Int?) {
        self.init(code, error.localizedDescription)
    }
}

class DataArray<T : Codable> : Codable {
    let list: [T]
}

class DataObject<T : Codable> : Codable {
    let user : T
}
