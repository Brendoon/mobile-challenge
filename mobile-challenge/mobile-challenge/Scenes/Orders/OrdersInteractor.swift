//
//  OrdersInteractor.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 01/03/19.
//  Copyright (c) 2019 Brendoon Ryos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol OrdersBusinessLogic {
  func fetchOrders()
  func fetchOrderDetails(id: String)
}

protocol OrdersDataStore {
  var loginResponse: LoginResponse? { get set }
  var ordersResponse: OrdersResponse? { get set }
  var orderId: String? { get set }
}

class OrdersInteractor: OrdersBusinessLogic, OrdersDataStore {
  var presenter: OrdersPresentationLogic?
  var worker: OrdersWorker?
  
  var loginResponse: LoginResponse?
  var ordersResponse: OrdersResponse?
  var orderId: String?
  
  var isFetchInProgress = false
  var currentOffset = -20
  
  init(worker: OrdersWorker? = OrdersWorker()) {
    self.worker = worker
  }
  
  // MARK: Fetch Orders
  func fetchOrders() {
    guard !isFetchInProgress else { return }
    isFetchInProgress = true
    
    currentOffset += 20
    let request = Orders.All.Request(token: loginResponse?.accessToken ?? "", offset: currentOffset)
    worker?.fetchOrders(request: request, completion: { result in
      switch result {
      case .success(let data):
        self.ordersResponse = data
        let response = Orders.All.Response(ordersResponse: data)
        self.presenter?.presentOrders(response: response)
      case .failure(let error):
        let response = Orders.All.Response(error: error)
        self.presenter?.presentErrorMessage(response: response)
      }
      
      DispatchQueue.main.async { self.isFetchInProgress = false }
    })
  }
  
  func fetchOrderDetails(id: String) {
    self.orderId = id
    let response = Orders.Details.Response()
    self.presenter?.presentOrderDetails(response: response)
  }
}
