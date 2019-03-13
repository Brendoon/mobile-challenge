//
//  SummaryTableViewCell.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 11/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class SummaryTableViewCell: OrderDetailsBaseTableViewCell {
  @IBOutlet weak var totalAmountLabel: UILabel!
  @IBOutlet weak var feesLabel: UILabel!
  @IBOutlet weak var liquidLabel: UILabel!
  
  static func height() -> CGFloat {
    return 140.0
  }
  
  override func setup(with item: Order) {
    totalAmountLabel.text = "+ " + Double.toCurrency(value: Double(item.amount.total), code: item.amount.currency)!
    feesLabel.text = "- " + Double.toCurrency(value: Double(item.amount.fees), code: item.amount.currency)!
    liquidLabel.text = "= " + Double.toCurrency(value: Double(item.amount.liquid!), code: item.amount.currency)!
  }
}
