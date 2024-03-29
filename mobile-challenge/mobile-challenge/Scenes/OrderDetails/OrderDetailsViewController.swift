//
//  OrderDetailsViewController.swift
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

protocol OrderDetailsDisplayLogic: class {
  func displayOrderDetails(viewModel: Orders.Details.ViewModel)
  func displayErrorMessage(viewModel: Orders.All.ViewModel)
}

class OrderDetailsViewController: UIViewController {
  var interactor: OrderDetailsBusinessLogic?
  var router: (NSObjectProtocol & OrderDetailsRoutingLogic & OrderDetailsDataPassing)?
  
  let orderDetailsView = OrderDetailsView()

  // MARK: Object lifecycle
  init() {
    super.init(nibName: .none, bundle: .none)
    title = "Pedido"
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Setup
  private func setup() {
    let viewController = self
    let interactor = OrderDetailsInteractor()
    let presenter = OrderDetailsPresenter()
    let router = OrderDetailsRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: View lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    fetchOrderDetails()
  }
  
  override func loadView() {
    self.view = orderDetailsView
  }
  
  // MARK: Do something
  func fetchOrderDetails() {
    orderDetailsView.activityIndicator.startAnimating()
    interactor?.fetchOrderDetails()
  }
}

extension OrderDetailsViewController: OrderDetailsDisplayLogic {
  func displayOrderDetails(viewModel: Orders.Details.ViewModel) {
    orderDetailsView.tableView.update(with: viewModel.order!)
    orderDetailsView.activityIndicator.stopAnimating()
  }
  
  func displayErrorMessage(viewModel: Orders.All.ViewModel) {}
}
