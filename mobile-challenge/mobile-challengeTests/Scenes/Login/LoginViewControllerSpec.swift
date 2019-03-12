//
//  LoginViewControllerSpec.swift
//  mobile-challengeTests
//
//  Created by Brendoon Ryos on 12/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Quick
import Nimble
import Moya
import Alamofire

@testable import mobile_challenge

class LoginViewControllerSpec: QuickSpec {
  override func spec() {
    describe("a LoginViewController") {
      var controller: LoginViewController!
      
      beforeEach {
        controller = LoginViewController()
      }
      
      it("should be able to create a controller") {
        expect(controller).toNot(beNil())
      }
      
      it("should have a view of type") {
        expect(controller.view).to(beAKindOf(LoginView.self))
      }
      
      it("should have a initial state") {
        expect(controller.loginView.loadingView.alpha).to(equal(1))
      }
      
      it("should have changed the initial state") {
        controller.displayLoginSucceeded(viewModel: Login.SignIn.ViewModel())
        expect(controller.loginView.loadingView.alpha).toEventually(equal(0))
      }
      
      it("should trigger fatal error if init with coder") {
        #if arch(x86_64)
        expect { () -> Void in
          let _ = LoginViewController(coder: NSCoder())
          }.to(throwAssertion())
        #endif
      }
    }
  }
}

