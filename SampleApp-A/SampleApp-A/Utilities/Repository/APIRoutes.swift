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
        
        static func userLogin(_ login: UserLogin) -> AppEndpoint<LoginModel> {
            return AppEndpoint(
                resourcePath: "/v3/46a90fc7-2206-4ff5-943f-3cbc088e2fc5",
                httpMethod: .POST,
                paramaters : login.toParamaters()
            )
        }
    }
    
    class Dash {
        static func userDashProfile() -> AppEndpoint<UserProfileModel> {
            return AppEndpoint(
                resourcePath: "/v3/60b67797-88dd-4a77-9e96-b34a204dab68",
                httpMethod: .GET
            )
        }
        
        static func rewardList() -> AppEndpoint<Rewards> {
            return AppEndpoint(
                resourcePath: "/v3/60b67797-88dd-4a77-9e96-b34a204dab68",
                httpMethod: .GET
            )
        }
    }
}
