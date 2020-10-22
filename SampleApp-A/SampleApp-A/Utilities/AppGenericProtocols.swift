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
