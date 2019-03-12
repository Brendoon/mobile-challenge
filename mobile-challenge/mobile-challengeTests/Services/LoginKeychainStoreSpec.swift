//
//  LoginKeychainStoreSpec.swift
//  mobile-challengeTests
//
//  Created by Brendoon Ryos on 12/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Quick
import Nimble

@testable import mobile_challenge

class LoginKeychainStoreSpec: QuickSpec {
  override func spec() {
    describe("a LoginKeychainStoreSpec") {
      var store: LoginKeychainStore!
      
      beforeEach {
        store = LoginKeychainStore()
        store.deleteSignInParams()
      }
      
      it("should delete both params") {
        let params = store.getSignInParams()
        
        expect(params.username).to(beNil())
        expect(params.password).to(beNil())
      }
      
      it("should update both params") {
        let username = "test@test.com"
        let password = "test@123"
        store.set(username: username, password: password)
        
        let params = store.getSignInParams()
        
        expect(params.username).to(equal(username))
        expect(params.password).to(equal(password))
        
        store.deleteSignInParams()
      }
    }
  }
}
