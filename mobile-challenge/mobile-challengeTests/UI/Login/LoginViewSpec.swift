//
//  LoginViewSpec.swift
//  mobile-challengeTests
//
//  Created by Brendoon Ryos on 11/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Quick
import Nimble

@testable import mobile_challenge

class LoginViewSpec: QuickSpec {
  override func spec() {
    describe("a LoginView") {
      var view: LoginView!
      
      beforeEach {
        view = LoginView.loadFromNib()
        view.signInBtnPressed(UIButton())
        view.usernameContainer.textField.text = .none
        view.passwordContainer.textField.text = .none
        view.textDidChange()
      }
      
      it("should have changed the UI when signInBtn is pressed") {
        expect(view.loadingView.alpha).to(equal(1))
        expect(view.activityIndicator.isAnimating).to(beTrue())
      }
      
      it("should have changed the UI when both textFields are empty") {
        expect(view.accessButton.alpha).to(equal(0.5))
        expect(view.accessButton.isUserInteractionEnabled).toNot(beTrue())
      }
      
      it("should have changed the UI when both textFields aren't empty") {
        view.usernameContainer.textField.text = "test@test.com"
        view.passwordContainer.textField.text = "test@test.com"
        view.textDidChange()
        expect(view.accessButton.alpha).to(equal(1))
        expect(view.accessButton.isUserInteractionEnabled).to(beTrue())
      }
    }
  }
}
