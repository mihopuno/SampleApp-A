//
//  UserRegisterViewController.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/22/20.
//

import UIKit

class UserRegisterViewController: UIViewController {

    @IBOutlet private weak var firstNameField: FieldView!
    @IBOutlet private weak var lastNameField: FieldView!
    @IBOutlet private weak var mobileField: FieldView!
    @IBOutlet private weak var mpinField: FieldView!
    @IBOutlet private weak var confirmMpinField: FieldView!
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var registerButton: UIButton!
    @IBOutlet private weak var buttonsBottomConstraints: NSLayoutConstraint!
    private lazy var viewModel : UserRegisterViewModel = { ()
        return UserRegisterViewModel()
    }()
    
    class func view() -> UIViewController {
        let viewController = UserRegisterViewController.instantiate(fromStoryboard: .Welcome)
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
        setupNotificationObservers()
    }
    
    private func configureViews() {
        firstNameField.setup("First Name", "First Name")
        lastNameField.setup("Last Name", "Last Name")
        mobileField.setup("Mobile Number", "Mobile Number")
        mpinField.setup("Enter MPIN", "Enter MPIN")
        confirmMpinField.setup("Confirmation MPIN", "Confirmation MPIN")
        backButton.addCornerRadius(5)
        registerButton.addCornerRadius(5)
        
        firstNameField.textField.returnKeyType = .next
        lastNameField.textField.returnKeyType = .next
        mobileField.textField.returnKeyType = .next
        mpinField.textField.returnKeyType = .next
        confirmMpinField.textField.returnKeyType = .done
        firstNameField.textField.delegate = self
        lastNameField.textField.delegate = self
        mobileField.textField.delegate = self
        mpinField.textField.delegate = self
        confirmMpinField.textField.delegate = self
        
        mobileField.textField.keyboardType = .namePhonePad
        mpinField.textField.keyboardType = .numberPad
        confirmMpinField.textField.keyboardType = .numberPad
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
            self.buttonsBottomConstraints.constant = 16
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
    
    @IBAction private func onTappedRegisterButton(_ sender: Any) {
        let firstName = firstNameField.textField.text ?? ""
        let lastName = lastNameField.textField.text ?? ""
        let mobile = mobileField.textField.text ?? ""
        let mpin = mpinField.textField.text ?? ""
        let cmpin = confirmMpinField.textField.text ?? ""
        viewModel.validateFirstName(firstNameField.fieldErrorMessage(_:), firstName)
        viewModel.validateLastName(lastNameField.fieldErrorMessage(_:), lastName)
        viewModel.validateMobileNumber(mobileField.fieldErrorMessage(_:), mobile)
        viewModel.validateMPIN(mpinField.fieldErrorMessage(_:),
                               confirmMpinField.fieldErrorMessage(_:),
                               mpin, cmpin)
        
        guard viewModel.isDataInputValid else {
            return
        }
        
        self.showAlertView("Success", "Your registration is complete.")
    }
}


extension UserRegisterViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstNameField.textField:
            lastNameField.textField.becomeFirstResponder()
            break
        case lastNameField.textField:
            mobileField.textField.becomeFirstResponder()
            break
        case mobileField.textField:
            mpinField.textField.becomeFirstResponder()
            break
        case mpinField.textField:
            confirmMpinField.textField.becomeFirstResponder()
            break
        case confirmMpinField.textField:
            textField.resignFirstResponder()
            break
        default: break
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case mpinField.textField, confirmMpinField.textField:
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
