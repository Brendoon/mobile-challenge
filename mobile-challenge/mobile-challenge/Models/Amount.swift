//
//  Amount.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 08/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation

struct Amount: Codable {
  let total: Int
  let addition: Int?
  let fees: Int
  let deduction: Int?
  let otherReceivers: Int
  let currency: String
  
  let paid: Int?
  let refunds: Int?
  let liquid: Int?
}
