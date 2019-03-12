//
//  OrderDetailsDelegateSpec.swift
//  mobile-challengeTests
//
//  Created by Brendoon Ryos on 12/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Quick
import Nimble

@testable import mobile_challenge


class OrderDetailsDelegateSpec: QuickSpec {
  override func spec() {
    describe("an OrdersDelegate") {
      var delegate: OrderDetailsDelegate!
      var tableView: OrderDetailsTableView!
      
      beforeEach {
        tableView = OrderDetailsTableView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        delegate = OrderDetailsDelegate(tableView: tableView)
      }
      
      it("should have cells with expected height") {
        let height = delegate.tableView(tableView, heightForRowAt: IndexPath(row: 0, section: 0))
        expect(height).to(equal(AmountTableViewCell.height()))
      }
    }
  }
}
