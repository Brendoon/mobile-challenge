//
//  CellType.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 11/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit
import Reusable

enum CellType {
  case amount
  case buyer
  case status
  case summary
  case payments
  
  func getClass() -> UITableViewCell.Type {
    switch self {
    case .amount:
      return AmountTableViewCell.self
    case .buyer:
      return BuyerTableViewCell.self
    case .status:
      return StatusTableViewCell.self
    case .summary:
      return SummaryTableViewCell.self
    case .payments:
      return PaymentsTableViewCell.self
    }
  }
  
  func getNib() -> UINib {
    switch self {
    case .amount:
      return AmountTableViewCell.nib
    case .buyer:
      return BuyerTableViewCell.nib
    case .status:
      return StatusTableViewCell.nib
    case .summary:
      return SummaryTableViewCell.nib
    case .payments:
      return PaymentsTableViewCell.nib
    }
  }
  
  func getIdentifier() -> String {
    switch self {
    case .amount:
      return AmountTableViewCell.reuseIdentifier
    case .buyer:
      return BuyerTableViewCell.reuseIdentifier
    case .status:
      return StatusTableViewCell.reuseIdentifier
    case .summary:
      return SummaryTableViewCell.reuseIdentifier
    case .payments:
      return PaymentsTableViewCell.reuseIdentifier
    }
  }
  
  func getHeight() -> CGFloat {
    switch self {
    case .amount:
      return AmountTableViewCell.height()
    case .buyer:
      return BuyerTableViewCell.height()
    case .status:
      return StatusTableViewCell.height()
    case .summary:
      return SummaryTableViewCell.height()
    case .payments:
      return PaymentsTableViewCell.height()
    }
  }
}
