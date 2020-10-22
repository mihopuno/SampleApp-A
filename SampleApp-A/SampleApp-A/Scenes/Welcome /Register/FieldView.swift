//
//  FieldView.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/22/20.
//

import Foundation
import UIKit

class FieldView : UIView {
    
    @IBOutlet private weak var fieldLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    func setup(_ hint: String, _ title: String) {
        fieldLabel.text = title
        textField.placeholder = hint
    }
    
    func fieldErrorMessage(_ errorMessage: String?) {
        errorLabel.text = errorMessage ?? nil
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
