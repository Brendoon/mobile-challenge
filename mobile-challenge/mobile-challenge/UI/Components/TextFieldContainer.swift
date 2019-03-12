//
//  TextField.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 07/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class TextFieldContainer: UIView {

  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var lineView: UIView!
  @IBOutlet weak var lineHeightConstraint: NSLayoutConstraint!
  
  var isEmpty: Bool {
    return textField.text?.isEmpty ?? true
  }
  
  var text: String {
    return textField.text ?? ""
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    textField.delegate = self
    textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: ColorPalette.white.withAlphaComponent(0.6)])
    textField.tintColor = ColorPalette.white
    textField.addTarget(self, action: #selector(textDidChange), for: .editingDidBegin)
    lineView.backgroundColor = ColorPalette.white.withAlphaComponent(0.4)
    lineHeightConstraint.constant = 0.5
  }
  
  @objc func textDidChange() {
    lineView.backgroundColor = ColorPalette.white
    lineHeightConstraint.constant = 1
  }
}

extension TextFieldContainer: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  func textFieldShouldClear(_ textField: UITextField) -> Bool {
    return true
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    return true
  }
}
