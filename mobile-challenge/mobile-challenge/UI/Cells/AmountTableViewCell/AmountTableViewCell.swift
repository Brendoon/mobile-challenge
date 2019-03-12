//
//  AmountTableViewCell.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 11/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit
import Reusable

final class AmountTableViewCell: OrderDetailsBaseTableViewCell {

  @IBOutlet weak var idLabel: UILabel!
  @IBOutlet weak var ownIdLabel: UILabel!
  @IBOutlet weak var totalAmountLabel: UILabel!
  @IBOutlet weak var methodLabel: UILabel!
  
  static func height() -> CGFloat {
    return 65.0
  }
  
  override func setup(with order: Order) {
    idLabel.text = order.id
    ownIdLabel.text = "sandbox:" + order.ownId
    totalAmountLabel.text = Double.toCurrency(value: Double(order.amount.total), code: order.amount.currency)
    methodLabel.text = Method(rawValue: order.payments.first?.fundingInstrument?.method.lowercased() ?? "boleto")?.description
  }
}
