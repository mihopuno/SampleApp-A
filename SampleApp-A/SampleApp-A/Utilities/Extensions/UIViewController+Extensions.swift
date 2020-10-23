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
    func showAlertView(_ title: String?, _ message: String?, handler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: handler)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showNetworkError(_ error: ErrorModel, handler: ((UIAlertAction) -> Void)? = nil) {
        let statusCode = error.statusCode == nil ? "" : " - \(error.statusCode!)"
        let alertController = UIAlertController(title: "Error\(statusCode)",
                                                message: error.message,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: handler)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension UIViewController {
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var sceneDelegate: SceneDelegate? {
        if #available(iOS 13.0, *) {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let delegate = windowScene.delegate as? SceneDelegate else { return nil }
            return delegate
        } else {
            return nil
        }
    }
}

extension UIViewController {
    var window: UIWindow? {
        if #available(iOS 13, *) {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                let delegate = windowScene.delegate as? SceneDelegate, let window = delegate.window else { return nil }
                   return window
        }
        
        guard let delegate = UIApplication.shared.delegate as? AppDelegate, let window = delegate.window else { return nil }
        return window
    }
}
