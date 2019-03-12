//
//  OrderDetailsTableView.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 11/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class OrderDetailsTableView: UITableView {

  fileprivate var customDataSource: OrderDetailsDataSource?
  fileprivate var customDelegate: OrderDetailsDelegate?
  
  convenience init() {
    self.init(frame: .zero, style: .plain)
  }
  
  override init(frame: CGRect, style: UITableView.Style) {
    super.init(frame: frame, style: style)
    customDelegate = OrderDetailsDelegate(tableView: self)
    customDataSource = OrderDetailsDataSource(tableView: self, delegate: customDelegate!)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func update(with item: Order) {
    customDataSource?.update(item)
  }
}
