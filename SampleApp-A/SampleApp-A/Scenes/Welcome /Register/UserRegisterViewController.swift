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
    
    class func view() -> UIViewController {
        let viewController = UserRegisterViewController.instantiate(fromStoryboard: .Welcome)
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
    }
    
    private func configureViews() {
        firstNameField.setup("First Name", "First Name")
        lastNameField.setup("Last Name", "Last Name")
        mobileField.setup("Mobile Number", "Mobile Number")
        mpinField.setup("Enter MPIN", "Enter MPIN")
        confirmMpinField.setup("Confirmation MPIN", "Confirmation MPIN")
        backButton.addCornerRadius(5)
        registerButton.addCornerRadius(5)
    }
    
    @IBAction private func onTappedBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func onTappedRegisterButton(_ sender: Any) {
        
    }
}
