//
//  OrdersResponse.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 08/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation

struct OrdersResponse: Codable {
  let summary: Summary
  let orders: [Order]
}
