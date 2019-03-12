//
//  OrdersDelegate.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 08/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class OrdersDelegate: NSObject, UITableViewDelegate {
  
  var items: [Order] = []
  weak var tableView: OrdersTableView?
  
  var didSelectItem: ((Order) -> ())?
  
  init(tableView: OrdersTableView) {
    self.tableView = tableView
    super.init()
    self.tableView?.delegate = self
  }
  
  func update(_ items: [Order]) {
    self.items.append(contentsOf: items)
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return OrderTableViewCell.height()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    didSelectItem?(items[indexPath.row])
  }
  
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return self.tableView?.footerView
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 60.0
  }
}
