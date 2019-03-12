//
//  OrdersTableView.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 08/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class OrdersTableView: UITableView {
  
  fileprivate var customDataSource: OrdersDataSource?
  fileprivate var customDelegate: OrdersDelegate?
  
  let footerView = FooterView.loadFromNib()

  convenience init() {
    self.init(frame: .zero, style: .plain)
  }
  
  override init(frame: CGRect, style: UITableView.Style) {
    super.init(frame: frame, style: style)
    customDelegate = OrdersDelegate(tableView: self)
    customDataSource = OrdersDataSource(tableView: self, delegate: customDelegate!)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setSelectionHandler(_ handler: @escaping (Order) -> ()) {
    customDelegate?.didSelectItem = handler
  }
  
  func update(with items: [Order]) {
    customDataSource?.update(items)
    customDelegate?.update(items)
  }
}
