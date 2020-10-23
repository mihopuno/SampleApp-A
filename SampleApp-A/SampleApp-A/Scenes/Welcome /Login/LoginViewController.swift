//
//  ViewController.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/22/20.
//

import UIKit

protocol LoginViewDelegate : class {
    func onLoginCredentialsInvalid(_ message: String)
    func onLoginRequestSuccess()
    func onLoginRequestFailed(_ error: ErrorModel)
}

class LoginViewController: UIViewController {

    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var showMPINButton: UIButton!
    @IBOutlet private weak var mpinTextField: UITextField!
    @IBOutlet private weak var mobileNumberTextField: UITextField!
    @IBOutlet private weak var buttonsBottomConstraints: NSLayoutConstraint!
    private lazy var viewModel : LoginViewModel = { ()
        return LoginViewModel(self)
    }()
    
    class func view() -> UIViewController {
        let viewController = LoginViewController.instantiate(fromStoryboard: .Welcome)
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureViews()
        setupNotificationObservers()
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
    
    private func setupNotificationObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardNotification(notification:)),
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil)
    }
    
    @objc private func keyboardNotification(notification: Notification) {
        guard let userInfo = notification.userInfo,
            let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let endFrameY = endFrame.origin.y
        let keyboardAnimationDuration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
        let animationCurveRawNSN = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
        let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
        let animationCurve: UIView.AnimationOptions = UIView.AnimationOptions(rawValue: animationCurveRaw)
        if endFrameY >= UIScreen.main.bounds.size.height {
            self.buttonsBottomConstraints.constant = 20
        } else {
            self.buttonsBottomConstraints.constant = (endFrame.size.height - view.safeAreaInsets.bottom) + 8
        }
        UIView.animate(withDuration: keyboardAnimationDuration,
                       delay: TimeInterval(0),
                       options: animationCurve,
                       animations: { if let view = self.view { view.layoutIfNeeded() } },
                       completion: nil)
    }

    @IBAction private func onTappedBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func onTappedLoginButton(_ sender: Any) {
        let mpin = mpinTextField.text ?? ""
        let mobileNumber = mobileNumberTextField.text ?? ""
        viewModel.userLoginAndValidate(mobileNumber, mpin)
    }
    
    @IBAction private func onTappedShowMPINButton(_ sender: Any) {
        mpinTextField.isSecureTextEntry = !mpinTextField.isSecureTextEntry
        let showTitle = mpinTextField.isSecureTextEntry ? "SHOW" : "HIDE"
        showMPINButton.setTitle(showTitle, for: .normal)
    }
}

extension LoginViewController : LoginViewDelegate {
    func onLoginRequestFailed(_ error: ErrorModel) {
        self.showNetworkError(error)
    }
    
    func onLoginCredentialsInvalid(_ message: String) {
        self.showAlertView("Error", message)
    }
    
    func onLoginRequestSuccess() {
        let dashViewController = DashListViewController.view()
        if #available(iOS 13, *),
           let window = self.sceneDelegate?.window {
            window.rootViewController = dashViewController
            window.makeKeyAndVisible()
        } else {
            guard let window = self.appDelegate.window else { return }
            window.rootViewController = dashViewController
            window.makeKeyAndVisible()
        }
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case mpinTextField:
            let count = textField.text?.count ?? 0
            if count >= 4 && string != "" {
                return false
            } else {
                return true
            }
        default:
            return true
        }
    }
}
