//
//  PaymentsTableViewCell.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 11/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class PaymentsTableViewCell: OrderDetailsBaseTableViewCell {
  
  @IBOutlet weak var paymentsCountLabel: UILabel!
  static func height() -> CGFloat {
    return 100.0
  }

  override func setup(with item: Order) {
    let count = item.payments.count
    print("Payments Count ==", count)
    if count > 1 {
      paymentsCountLabel.text = "\(count) pagamentos"
    } else {
      paymentsCountLabel.text = "\(count) pagamento"
    }
  }
}
