//
//  ViewController.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/22/20.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var showMPINButton: UIButton!
    @IBOutlet private weak var mpinTextField: UITextField!
    @IBOutlet private weak var mobileNumberTextField: UITextField!
    
    class func view() -> UIViewController {
        let viewController = LoginViewController.instantiate(fromStoryboard: .Welcome)
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction private func onTappedBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func onTappedLoginButton(_ sender: Any) {
        let mpin = mpinTextField
        let mobileNumber = mobileNumberTextField
    }
    
    @IBAction private func onTappedShowMPINButton(_ sender: Any) {
        mpinTextField.isSecureTextEntry = !mpinTextField.isSecureTextEntry
        let showTitle = mpinTextField.isSecureTextEntry ? "SHOW" : "HIDE"
    }
}

