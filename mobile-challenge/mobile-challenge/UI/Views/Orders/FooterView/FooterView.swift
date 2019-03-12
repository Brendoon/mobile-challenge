//
//  FooterView.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 11/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class FooterView: UIView {

  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  class func loadFromNib() -> FooterView {
    let nib = UINib(nibName: String(describing: self), bundle: .main)
    let view = nib.instantiate(withOwner: nil, options: nil).first as! FooterView
    return view
  }
}
