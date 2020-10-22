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
    @IBOutlet private weak var fieldFextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    func setup(_ hint: String, _ title: String) {
        fieldLabel.text = title
        fieldFextField.placeholder = hint
    }
    
    func fieldInvalid(_ message: String) {
        errorLabel.text = message
    }
    
    func fieldValid() {
        errorLabel.text = nil
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
