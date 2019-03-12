//
//  OrdersDataSourceSpec.swift
//  mobile-challengeTests
//
//  Created by Brendoon Ryos on 12/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Quick
import Nimble
@testable import mobile_challenge

class TableViewDelegateMock: NSObject, UITableViewDelegate {
  
}

class OrdersDataSourceSpec: QuickSpec {
  override func spec() {
    describe("a OrdersDataSource ") {
      var dataSource: OrdersDataSource!
      var order: Order!
      var tableView: UITableView!
      
      beforeEach {
        let sampleData = MoipAPI.fetchOrders(token: "", offset: 1).sampleData
        let ordersResponse = try? JSONDecoder().decode(OrdersResponse.self, from: sampleData)
        order = ordersResponse?.orders.first
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        dataSource = OrdersDataSource(tableView: tableView, delegate: TableViewDelegateMock())
      }
      
      it("should have a valid dataSource") {
        expect(dataSource).toNot(beNil())
      }
      
      it("should have the expected number of items") {
        let count = dataSource.tableView(tableView, numberOfRowsInSection: 0)
        expect(count).to(equal(0))
      }
      
      it("should have be able to update items") {
        dataSource.update([order!, order!, order!])
        let count = dataSource.tableView(tableView, numberOfRowsInSection: 0)
        expect(count).to(equal(3))
      }
      
      it("should return the expected cell") {
        dataSource.update([order!])
        let cell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        expect(cell).to(beAKindOf(OrderTableViewCell.self))
      }
    }
  }
}
