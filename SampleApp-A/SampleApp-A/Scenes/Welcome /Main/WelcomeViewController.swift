//
//  WelcomeViewController.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/22/20.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
    }
    
    private func configureViews() {
        loginButton.addCornerRadius(5)
        registerButton.addCornerRadius(5)
    }
    
    @IBAction private func onTappedLoginButton(_ sender: Any) {
        let view = LoginViewController.view()
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    @IBAction private func onTappedRegisterButton(_ sender: Any) {
        let view = UserRegisterViewController.view()
        self.navigationController?.pushViewController(view, animated: true)
    }
}
