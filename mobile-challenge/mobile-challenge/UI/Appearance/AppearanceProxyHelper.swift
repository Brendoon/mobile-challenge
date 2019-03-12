//
//  AppearanceProxyHelper.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 24/01/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

struct AppearanceProxyHelper {
  
  private init() {}
  
  static func customizeNavigationBar(){
    let navBarAppearance = UINavigationBar.appearance()
    navBarAppearance.isTranslucent = false
    navBarAppearance.barTintColor = ColorPalette.lightBlue
    navBarAppearance.tintColor = ColorPalette.white
    navBarAppearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: ColorPalette.white]
  }
}

extension UINavigationController {
  open override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
}
