//
//  BuyerTableViewCellSpec.swift
//  mobile-challengeTests
//
//  Created by Brendoon Ryos on 12/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Quick
import Nimble

@testable import mobile_challenge

class BuyerTableViewCellSpec: QuickSpec {
  override func spec() {
    describe("a BuyerTableViewCell") {
      var cell: BuyerTableViewCell!
      var order: Order!
      
      beforeEach {
        let sampleData = MoipAPI.fetchOrder(token: "", id: "").sampleData
        order = try? JSONDecoder().decode(Order.self, from: sampleData)
        
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        
        tableView.register(cellType: BuyerTableViewCell.self)
        
        cell = tableView.dequeueReusableCell(for: IndexPath(row: 0, section: 0), cellType: BuyerTableViewCell.self)
        cell.setup(with: order)
      }
      
      it("should not be nil") {
        expect(cell).toNot(beNil())
      }
      
      it("should have expected height") {
        expect(BuyerTableViewCell.height()).to(equal(105))
      }
      
      it("should have expected selection style") {
        expect(cell.selectionStyle == .none).to(beTruthy())
      }
      
      it("should have expected name after setup") {
        expect(cell.buyerNameLabel.text).to(equal(order.customer.fullname))
      }
      
      it("should have expected email after setup") {
        expect(cell.buyerEmailLabel.text).to(equal(order.customer.email))
      }
    }
  }
}
