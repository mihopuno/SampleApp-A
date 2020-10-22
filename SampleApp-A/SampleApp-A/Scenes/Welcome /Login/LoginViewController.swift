//
//  ViewController.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/22/20.
//

import UIKit

class LoginViewController: UIViewController {

    class func view() -> UIViewController {
        let viewController = LoginViewController.instantiate(fromStoryboard: .Welcome)
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

