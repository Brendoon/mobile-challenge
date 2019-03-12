//
//  Double+CurrencyFormatter.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 08/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

extension Double {
  static func toCurrency(value: Double, code: String = "BRL") -> String? {
    let formatter = NumberFormatter()
    formatter.currencyCode = code
    formatter.numberStyle = .currency
    return formatter.string(from: value as NSNumber)
  }
}
