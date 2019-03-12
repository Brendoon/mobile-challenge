//
//  OrdersDataSource.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 08/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class OrdersDataSource: NSObject, ItemsTableViewDataSource {
  var items: [Order] = []
  var tableView: UITableView?
  var delegate: UITableViewDelegate?
  
  required init(tableView: UITableView, delegate: UITableViewDelegate) {
    self.tableView = tableView
    self.delegate = delegate
    super.init()
    setupTableView()
  }
  
  func registerTableView() {
    tableView?.register(cellType: OrderTableViewCell.self)
  }
  
  func update(_ items: [Order]) {
    self.items.append(contentsOf: items)
    self.tableView?.reloadData()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(for: indexPath, cellType: OrderTableViewCell.self)
    cell.tag = indexPath.row
    cell.setup(with: items[indexPath.row])
    return cell
  }
}
