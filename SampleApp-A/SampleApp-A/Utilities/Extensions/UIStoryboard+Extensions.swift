//
//  UIStoryboard+Extensions.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/22/20.
//

import UIKit

extension UIStoryboard {
    
    enum Storyboard: String {
        
        case Welcome
        case Dash

        var instance: UIStoryboard {
            return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
        }
        
        func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {
            let storyboardId = (viewControllerClass as UIViewController.Type).storyboardId
            return instance.instantiateViewController(withIdentifier: storyboardId) as! T
        }
    }
    
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.rawValue, bundle: bundle)
    }
    
    class func storyboard(_ storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.rawValue, bundle: bundle)
    }
    
}
