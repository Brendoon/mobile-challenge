//
//  ViewCode.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 06/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation

protocol ViewCode: class {
  func setupConstraints()
  func buildViewHierarchy()
  func setupViewCode()
  func configureViews()
}

extension ViewCode {
  func setupViewCode() {
    buildViewHierarchy()
    setupConstraints()
    configureViews()
  }
  
  func configureViews() {}
}
