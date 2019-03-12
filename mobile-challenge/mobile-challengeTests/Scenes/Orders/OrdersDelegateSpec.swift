//
//  OrdersDelegateSpec.swift
//  mobile-challengeTests
//
//  Created by Brendoon Ryos on 12/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Quick
import Nimble

@testable import mobile_challenge

class OrderSelectionHandlerMock: NSObject {
  
  var didTriggerSelection = false
  
  func selectionHandler(_ order: Order) {
    didTriggerSelection = true
  }
}


class OrdersDelegateSpec: QuickSpec {
  override func spec() {
    describe("an OrdersDelegate") {
      var delegate: OrdersDelegate!
      var tableView: OrdersTableView!
      var order: Order!
      var mock: OrderSelectionHandlerMock!
      
      beforeEach {
        let sampleData = MoipAPI.fetchOrders(token: "", offset: 1).sampleData
        let ordersResponse = try? JSONDecoder().decode(OrdersResponse.self, from: sampleData)
        order = ordersResponse?.orders.first
        tableView = OrdersTableView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        mock = OrderSelectionHandlerMock()
        delegate = OrdersDelegate(tableView: tableView)
        delegate.didSelectItem = mock.selectionHandler
      }
      
      it("should have cells with expected height") {
        let height = delegate.tableView(tableView, heightForRowAt: IndexPath(row: 0, section: 0))
        expect(height).to(equal(OrderTableViewCell.height()))
      }
      
      it("should have footer with expected height") {
        let height = delegate.tableView(tableView, heightForFooterInSection: 0)
        expect(height).to(equal(60))
      }
      
      it("should have footer of expected type") {
        let view = delegate.tableView(tableView, viewForFooterInSection: 0)
        expect(view).to(beAKindOf(FooterView.self))
      }
      
      it("should trigger selectionHandler") {
        delegate.update([order])
        mock.didTriggerSelection = false
        delegate.tableView(UITableView(), didSelectRowAt: IndexPath(row: 0, section: 0))
        expect(mock.didTriggerSelection).to(beTruthy())
      }
    }
  }
}
