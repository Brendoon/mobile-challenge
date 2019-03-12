//
//  BuyerTableViewCell.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 11/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class BuyerTableViewCell: OrderDetailsBaseTableViewCell {
  
  @IBOutlet weak var buyerNameLabel: UILabel!
  @IBOutlet weak var buyerEmailLabel: UILabel!
  
  static func height() -> CGFloat {
    return 105.0
  }

  override func setup(with item: Order) {
    buyerNameLabel.text = item.customer.fullname
    buyerEmailLabel.text = item.customer.email
  }
}
