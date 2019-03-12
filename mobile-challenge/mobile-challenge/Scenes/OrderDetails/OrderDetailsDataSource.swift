//
//  OrderDetailsDataSource.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 11/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class OrderDetailsDataSource: NSObject, ItemsTableViewDataSource {
  var items: [CellType] = []
  var tableView: UITableView?
  var delegate: UITableViewDelegate?
  var item: Order?
  
  required init(tableView: UITableView, delegate: UITableViewDelegate) {
    self.tableView = tableView
    self.delegate = delegate
    super.init()
    setupTableView()
  }
  
  func registerTableView() {
    for item in items {
      tableView?.register(item.getNib(), forCellReuseIdentifier: item.getIdentifier())
    }
  }
  
  func update(_ item: Order) {
    self.item = item
    self.items = [.amount, .buyer, .status, .summary, .payments]
    self.registerTableView()
    self.tableView?.reloadData()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: items[indexPath.row].getIdentifier(), for: indexPath) as! OrderDetailsBaseTableViewCell
    
    if let item = self.item { cell.setup(with: item) }
    return cell
  }
}
