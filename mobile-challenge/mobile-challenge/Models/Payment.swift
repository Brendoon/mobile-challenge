//
//  Payment.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 08/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation

struct Payment: Codable {
  let id: String
  let installmentCount: Int
  let fundingInstrument: FundingInstrument?
}
