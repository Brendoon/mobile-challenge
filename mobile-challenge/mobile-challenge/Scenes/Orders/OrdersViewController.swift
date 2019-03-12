//
//  OrdersViewController.swift
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

protocol OrdersDisplayLogic: class {
  func displayOrders(viewModel: Orders.All.ViewModel)
  func displayOrderDetails(viewModel: Orders.Details.ViewModel)
  func displayErrorMessage(viewModel: Orders.All.ViewModel)
}

class OrdersViewController: UIViewController {
  var interactor: OrdersBusinessLogic?
  var router: (NSObjectProtocol & OrdersRoutingLogic & OrdersDataPassing)?
  
  let ordersView = OrdersView()
  var currentCount: Int = 0

  // MARK: Object lifecycle
  init() {
    super.init(nibName: .none, bundle: .none)
    title = "Pedidos"
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Setup
  private func setup() {
    let viewController = self
    let interactor = OrdersInteractor()
    let presenter = OrdersPresenter()
    let router = OrdersRouter()
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
    setupView()
    fetchOrders()
  }
  
  override func loadView() {
    self.view = ordersView
  }
  
  func setupView() {
    ordersView.tableView.prefetchDataSource = self
    ordersView.tableView.setSelectionHandler(didSelectOrder)
  }
  
  func didSelectOrder(_ order: Order) {
    interactor?.fetchOrderDetails(id: order.id)
  }
  
  // MARK: Fetch Orders
  func fetchOrders() {
    if currentCount == 0 {
      ordersView.activityIndicator.startAnimating()
    }
    interactor?.fetchOrders()
  }
}

extension OrdersViewController: OrdersDisplayLogic {
  func displayOrders(viewModel: Orders.All.ViewModel) {
    currentCount += 20
    ordersView.update(with: viewModel.ordersResponse!)
    ordersView.activityIndicator.stopAnimating()
    ordersView.tableView.footerView.activityIndicator.stopAnimating()
  }
  
  func displayOrderDetails(viewModel: Orders.Details.ViewModel) {
    router?.routeToOrderDetails()
  }
  
  func displayErrorMessage(viewModel: Orders.All.ViewModel) {}
}

// MARK: - UICollectionViewDataSourcePrefetching
extension OrdersViewController: UITableViewDataSourcePrefetching {
  func isLoadingCell(for tag: Int) -> Bool {
    return tag + 1 >= currentCount
  }
  
  func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
    guard let tag = tableView.visibleCells.last?.tag else { return }
    if isLoadingCell(for: tag) {
      ordersView.tableView.footerView.activityIndicator.startAnimating()
      fetchOrders()
    }
  }
}
