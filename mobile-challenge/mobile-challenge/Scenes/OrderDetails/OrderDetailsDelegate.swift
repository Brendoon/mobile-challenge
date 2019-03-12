//
//  OrderDetailsDelegate.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 11/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class OrderDetailsDelegate: NSObject, UITableViewDelegate {
  
  var items: [CellType] = [.amount, .buyer, .status, .summary, .payments]
  weak var tableView: UITableView?
  
  init(tableView: UITableView) {
    self.tableView = tableView
    super.init()
    self.tableView?.delegate = self
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return items[indexPath.row].getHeight()
  }
}
