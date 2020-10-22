//
//  UIViewController+Extensions.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/22/20.
//

import UIKit

extension UIViewController {
    
    // MARK: - UIStoryboard
    
    class var storyboardId: String {
        return String(describing: self)
    }
    
    static func instantiate(fromStoryboard storyboard: UIStoryboard.Storyboard) -> Self {
        return storyboard.viewController(viewControllerClass: self)
    }
    
    // MARK: - UINib
    
    private static func nib<T: UIViewController>() -> T {
        return T(nibName: String(describing: self), bundle: nil)
    }
    
    public class func fromNib() -> Self {
        return nib()
    }
    
    var className : String { return String(describing: self.self) }
}


extension UIViewController {
    func showAlertView(_ title: String?, _ message: String?) {
        let alertController = UIAlertController(title: title,
                                                message: title,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
