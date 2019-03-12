//
//  NetworkManagerMock.swift
//  mobile-challengeTests
//
//  Created by Brendoon Ryos on 12/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Moya
import Alamofire

@testable import mobile_challenge

class NetworkManagerMock: Networkable {
  var provider: MoyaProvider<MoipAPI> = MoyaProvider<MoipAPI>()
  
  func signIn(request: Login.SignIn.Request, completion: @escaping (Result<LoginResponse>) -> ()) {
    
  }
  
  func fetchOrders(request: Orders.All.Request, completion: @escaping (Result<OrdersResponse>) -> ()) {
    let sampleData = MoipAPI.fetchOrders(token: "", offset: 1).sampleData
    let ordersResponse = try! JSONDecoder().decode(OrdersResponse.self, from: sampleData)
    completion(Result.success(ordersResponse))
  }
  
  func fetchOrderDetails(request: Orders.Details.Request, completion: @escaping (Result<Order>) -> ()) {
    let sampleData = MoipAPI.fetchOrder(token: "", id: "").sampleData
    let order = try! JSONDecoder().decode(Order.self, from: sampleData)
    completion(Result.success(order))
  }
}
