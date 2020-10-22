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
       
        configureViews()
    }
    
    private func configureViews() {
        backButton.addCornerRadius(5)
        loginButton.addCornerRadius(5)
        mpinTextField.delegate = self
        mpinTextField.returnKeyType = .next
        mpinTextField.keyboardType = .numberPad
        mobileNumberTextField.keyboardType = .namePhonePad
        mobileNumberTextField.delegate = self
        mobileNumberTextField.returnKeyType = .done
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

extension LoginViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case mpinTextField:
            textField.resignFirstResponder()
            break
        case mobileNumberTextField:
            mpinTextField.becomeFirstResponder()
            break
        default: break
        }
        return true
    }
}
