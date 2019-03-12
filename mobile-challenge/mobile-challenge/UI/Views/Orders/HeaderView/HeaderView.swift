//
//  HeaderView.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 09/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class HeaderView: UIView {
  
  @IBOutlet weak var summaryLabel: UILabel!
  
  class func loadFromNib() -> HeaderView {
    let nib = UINib(nibName: String(describing: self), bundle: .main)
    let view = nib.instantiate(withOwner: nil, options: nil).first as! HeaderView
    return view
  }
  
  func update(with summary: Summary) {
    let formattedValue = Double.toCurrency(value: Double(summary.amount)) ?? ""
    summaryLabel.text = "\(summary.count) pedidos totalizando \(formattedValue)"
  }
}
