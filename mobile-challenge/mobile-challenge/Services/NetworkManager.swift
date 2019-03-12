//
//  NetworkManager.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 01/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Moya
import Alamofire

enum APIEnvironment {
  case staging
  case qa
  case production
}

protocol Networkable {
  var provider: MoyaProvider<MoipAPI> { get }
  func signIn(request: Login.SignIn.Request, completion: @escaping (Result<LoginResponse>) -> ())
  func fetchOrders(request: Orders.All.Request, completion: @escaping (Result<OrdersResponse>) -> ())
  func fetchOrderDetails(request: Orders.Details.Request, completion: @escaping (Result<Order>) -> ())
}

class NetworkManager: Networkable {
  
  var provider: MoyaProvider<MoipAPI> = MoyaProvider<MoipAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])
  
  func signIn(request: Login.SignIn.Request, completion: @escaping (Result<LoginResponse>) -> ()) {
    provider.request(.login(oauthParams: request.oauthParams)) { result in
      switch result {
      case .success(let response):
        do {
          let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: response.data)
          completion(Result.success(loginResponse))
        } catch let error {
          completion(Result.failure(error))
          print("data could not be decoded: \(error)")
        }
      case .failure(let error):
        completion(Result.failure(error))
      }
    }
  }
  
  func fetchOrders(request: Orders.All.Request, completion: @escaping (Result<OrdersResponse>) -> ()) {
    provider.request(.fetchOrders(token: request.token, offset: request.offset)) { result in
      switch result {
      case .success(let response):
        do {
          let ordersResponse = try JSONDecoder().decode(OrdersResponse.self, from: response.data)
          completion(Result.success(ordersResponse))
        } catch let error {
          completion(Result.failure(error))
          print("data could not be decoded: \(error)")
        }
      case .failure(let error):
        completion(Result.failure(error))
      }
    }
  }
  
  func fetchOrderDetails(request: Orders.Details.Request, completion: @escaping (Result<Order>) -> ()) {
    provider.request(.fetchOrder(token: request.token, id: request.id)) { result in
      switch result {
      case .success(let response):
        do {
          let order = try JSONDecoder().decode(Order.self, from: response.data)
          completion(Result.success(order))
        } catch let error {
          completion(Result.failure(error))
          print("data could not be decoded: \(error)")
        }
      case .failure(let error):
        completion(Result.failure(error))
      }
    }
  }
}
