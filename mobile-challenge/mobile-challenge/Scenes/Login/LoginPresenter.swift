//
//  LoginPresenter.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 01/03/19.
//  Copyright (c) 2019 Brendoon Ryos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginPresentationLogic {
  func presentLoginSucceeded(response: Login.SignIn.Response)
  func presentErrorMessage(response: Login.SignIn.Response)
}

class LoginPresenter: LoginPresentationLogic {
  weak var viewController: LoginDisplayLogic?
  
  // MARK: Present Login Succeeded
  func presentLoginSucceeded(response: Login.SignIn.Response) {
    let viewModel = Login.SignIn.ViewModel()
    viewController?.displayLoginSucceeded(viewModel: viewModel)
  }
  
  // MARK: Present Error Message
  func presentErrorMessage(response: Login.SignIn.Response) {
    let viewModel = Login.SignIn.ViewModel()
    viewController?.displayErrorMessage(viewModel: viewModel)
  }
}
