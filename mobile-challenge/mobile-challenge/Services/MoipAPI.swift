//
//  MoipAPI.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 28/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//
import Moya
import Keys

fileprivate struct MoipAPIConfig {
  private init() {}
  fileprivate static let keys = MobileChallengeKeys()
  
  static let dictionary: [String: String] = {
    return ["client_id": keys.client_id, "client_secret": keys.client_secret, "grant_type": keys.grant_type, "scope": keys.scope]
  }()
}


enum MoipAPI {
  case login(oauthParams: [String: String])
  case fetchOrders(token: String, offset: Int)
  case fetchOrder(token: String, id: String)
}

extension MoipAPI: TargetType {
  var baseURL: URL {
    switch self {
    case .login:
      guard let url = URL(string: "https://connect-sandbox.moip.com.br") else { fatalError("baseURL could not be configured.") }
      return url
    case .fetchOrders, .fetchOrder:
      guard let url = URL(string: "https://sandbox.moip.com.br/v2") else { fatalError("baseURL could not be configured.") }
      return url
    }
  }
  
  var path: String {
    switch self {
    case .login:
      return "/oauth/token"
    case .fetchOrders:
      return "/orders"
    case .fetchOrder(_, let id):
      return "/orders/\(id)"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .login:
      return .post
    default:
      return .get
    }
  }
  
  var task: Task {
    switch self {
    case .login(let oauthParams):
      let allParams: [String: Any] = oauthParams.merging(MoipAPIConfig.dictionary) { (_, new) in new }
      return .requestParameters(parameters: allParams, encoding: URLEncoding.httpBody)
    case .fetchOrders(_, let offset):
      return .requestParameters(parameters: ["offset": offset], encoding: URLEncoding.queryString)
    case .fetchOrder:
      return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    switch self {
    case .login:
      return ["Content-type": "application/x-www-form-urlencoded"]
    case .fetchOrders(let token, _), .fetchOrder(let token, _):
      return ["Content-type": "application/json", "Authorization": "OAuth \(token)"]
    }
  }
}
