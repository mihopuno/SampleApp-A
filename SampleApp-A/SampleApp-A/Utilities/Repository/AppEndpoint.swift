//
//  AppEndpoint.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/23/20.
//

import Foundation

struct AppEndpoint<T> {
    var httpMethod: HTTPMethod
    var headers: HTTPHeaders?
    var timeout: TimeInterval = 10
    var httpBody: Data?
    
    var url: URL?
    var resourcePath : String = ""
    
    init(resourcePath: String,
         httpMethod: HTTPMethod,
         timeout: TimeInterval = 10) {
        self.resourcePath = resourcePath
        self.url = URL(string: "https://run.mocky.io" + resourcePath)
        self.httpMethod = httpMethod
        self.timeout = timeout
    }
    
    init(urlString: String,
         httpMethod: HTTPMethod,
         timeout: TimeInterval = 10) {
        self.url = URL(string: urlString)
        self.httpMethod = httpMethod
        self.timeout = timeout
    }
}
