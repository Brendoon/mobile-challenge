//
//  StatusTableViewCell.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 11/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class StatusTableViewCell: OrderDetailsBaseTableViewCell {
  
  @IBOutlet weak var createdAtLabel: UILabel!
  @IBOutlet weak var updatedAtLabel: UILabel!
  @IBOutlet weak var statusLabel: UILabel!
  
  static func height() -> CGFloat {
    return 75.0
  }

  override func setup(with item: Order) {
    createdAtLabel.text = Date.getFormattedDate(string: item.createdAt)
    updatedAtLabel.text = Date.getFormattedDate(string: item.updatedAt)
    let status = Status(rawValue: item.status.lowercased())
    statusLabel.text = status?.name
    statusLabel.textColor = status?.color
    statusLabel.layer.borderColor = status?.color.cgColor
  }
}
