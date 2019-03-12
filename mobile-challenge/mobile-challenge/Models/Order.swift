//
//  Order.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 08/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation

struct Order: Codable {
  let id: String
  let ownId: String
  let status: String
  let createdAt: String
  let updatedAt: String
  let amount: Amount
  let payments: [Payment]
  let customer: Customer
}
