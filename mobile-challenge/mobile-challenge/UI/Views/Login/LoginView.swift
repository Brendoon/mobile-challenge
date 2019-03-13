//
//  LoginView.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 06/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class LoginView: UIView {
  
  @IBOutlet weak var usernameContainer: TextFieldContainer!
  @IBOutlet weak var passwordContainer: TextFieldContainer!
  @IBOutlet weak var accessButton: UIButton!
  @IBOutlet weak var loadingView: UIView!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  var signInParams: ((String, String) -> ())?
  
  class func loadFromNib() -> LoginView {
    let nib = UINib(nibName: String(describing: self), bundle: .main)
    let view = nib.instantiate(withOwner: nil, options: nil).first as! LoginView
    return view
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    usernameContainer.textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    passwordContainer.textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    accessButton.isUserInteractionEnabled = false
    applyGradient(withColours: [ColorPalette.blue, ColorPalette.lightBlue], gradientOrientation: .topRightBottomLeft)
    loadingView.applyGradient(withColours: [ColorPalette.blue, ColorPalette.lightBlue], gradientOrientation: .topRightBottomLeft)
  }
  
  @objc func textDidChange() {
    if !usernameContainer.isEmpty && !passwordContainer.isEmpty {
      accessButton.alpha = 1
      accessButton.isUserInteractionEnabled = true
    } else {
      accessButton.alpha = 0.5
      accessButton.isUserInteractionEnabled = false
    }
  }
  
  func hideLoadingView() {
    UIView.animate(withDuration: 1) {
      self.loadingView.alpha = 0
      self.activityIndicator.stopAnimating()
    }
  }
  
  @IBAction func signInBtnPressed(_ sender: UIButton) {
    signInParams?(usernameContainer.text, passwordContainer.text)
    loadingView.alpha = 1
    activityIndicator.startAnimating()
  }
}
