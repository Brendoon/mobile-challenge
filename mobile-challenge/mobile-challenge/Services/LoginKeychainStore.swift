//
//  LoginKeychainStore.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 06/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation
import KeychainSwift

protocol LoginStoreProtocol {
  func deleteSignInParams()
  func set(username: String, password: String)
  func getSignInParams() -> (username: String?, password: String?)
}

class LoginKeychainStore: LoginStoreProtocol {
  class Key {
    static let keychainPrefix: String = "br.bryos.mobile-challenge"
    static let username: String = "\(keychainPrefix).usename"
    static let password: String = "\(keychainPrefix).password"
  }
  
  func deleteSignInParams() {
    let keychain = KeychainSwift(keyPrefix: Key.keychainPrefix)
    keychain.delete(Key.username)
    keychain.delete(Key.password)
  }
  
  func set(username: String, password: String) {
    let keychain = KeychainSwift(keyPrefix: Key.keychainPrefix)
    keychain.set(username, forKey: Key.username)
    keychain.set(password, forKey: Key.password)
  }
  
  func getSignInParams() -> (username: String?, password: String?) {
    let keychain = KeychainSwift(keyPrefix: Key.keychainPrefix)
    return (keychain.get(Key.username), keychain.get(Key.password))
  }
}
