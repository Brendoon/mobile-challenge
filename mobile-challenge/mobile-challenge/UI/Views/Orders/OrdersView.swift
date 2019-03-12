//
//  OrdersView.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 08/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit
import SnapKit

class OrdersView: UIView {
  lazy var activityIndicator: UIActivityIndicatorView = {
    let view = UIActivityIndicatorView(style: .whiteLarge)
    view.color = ColorPalette.blue
    return view
  }()
  
  lazy var tableView: OrdersTableView = {
    let view = OrdersTableView()
    view.separatorStyle = .none
    return view
  }()
  
  lazy var headerView: HeaderView = {
    let view = HeaderView.loadFromNib()
    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViewCode()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func update(with ordersResponse: OrdersResponse) {
    headerView.update(with: ordersResponse.summary)
    tableView.update(with: ordersResponse.orders)
  }
}

extension OrdersView: ViewCode {
  func buildViewHierarchy() {
    addSubview(headerView)
    addSubview(tableView)
    addSubview(activityIndicator)
  }
  
  func setupConstraints() {
    let height: CGFloat = 80
    
    headerView.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.height.equalTo(height)
    }
    
    tableView.snp.makeConstraints { make in
      make.top.equalTo(height)
      make.bottom.equalToSuperview()
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
    }
    
    activityIndicator.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
}
