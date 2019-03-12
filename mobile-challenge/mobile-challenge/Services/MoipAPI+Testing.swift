//
//  MoipAPI+Testing.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 28/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Moya

extension MoipAPI {
  var sampleData: Data {
    switch self {
    case .login:
      return stubbedResponse("Login")
    case .fetchOrders:
      return stubbedResponse("Orders")
    case .fetchOrder:
      return stubbedResponse("Order")
    }
  }
  
  func stubbedResponse(_ filename: String, bundle: Bundle = .main) -> Data! {
    let path = bundle.path(forResource: filename, ofType: "json")
    return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
  }
}
