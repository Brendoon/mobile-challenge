//
//  OrderDetailsPresenter.swift
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

protocol OrderDetailsPresentationLogic {
  func presentOrderDetails(response: Orders.Details.Response)
  func presentErrorMessage(response: Orders.All.Response)
}

class OrderDetailsPresenter: OrderDetailsPresentationLogic {
  weak var viewController: OrderDetailsDisplayLogic?
  
  // MARK: Present Order Details
  func presentOrderDetails(response: Orders.Details.Response) {
    let viewModel = Orders.Details.ViewModel(order: response.order)
    viewController?.displayOrderDetails(viewModel: viewModel)
  }
  
  // MARK: Present Error Message
  func presentErrorMessage(response: Orders.All.Response) {
    let viewModel = Orders.All.ViewModel(error: response.error)
    viewController?.displayErrorMessage(viewModel: viewModel)
  }
}
