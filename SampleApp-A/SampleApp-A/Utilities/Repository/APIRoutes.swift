//
//  AppAPIRoutes.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/23/20.
//

import Foundation

class APIRoutes {
    class Welcome {
        static func userRegister(_ registration: UserRegistration) -> AppEndpoint<RegisterModel> {
            return AppEndpoint(
                resourcePath: "/v3/c15d5893-a517-4958-8aa4-dc4b997bba02",
                httpMethod: .POST,
                paramaters : registration.toParameters()
            )
        }
        
        static func userLogin(_ login: UserLogin) -> AppEndpoint<LoginUserModel> {
            return AppEndpoint(
                resourcePath: "/v3/c15d5893-a517-4958-8aa4-dc4b997bba02",
                httpMethod: .POST,
                paramaters : login.toParamaters()
            )
        }
    }
    
    class Dash {
        static func userDashProfile() {
            
        }
        
        static func rewardList() {
            
        }
    }
}
