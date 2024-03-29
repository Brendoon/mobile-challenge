//
//  LoginModels.swift
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

enum Login {
  // MARK: Use cases
  
  enum SignIn {
    struct Request {
      let username: String
      let password: String
      
      init(username: String, password: String) {
        self.username = username
        self.password = password
      }
      
      var oauthParams: [String: String] {
        let uuid = UIDevice.current.identifierForVendor?.uuidString ?? ""
        return ["username": username, "password": password, "device_id": uuid]
      }
    }
    struct Response {
      private let error: Error?
      
      init(error: Error? = .none) {
        self.error = error
      }
    }
    struct ViewModel {}
  }
  
  enum SignUp {
    struct Request {}
    struct Response {}
    struct ViewModel {}
  }
}
