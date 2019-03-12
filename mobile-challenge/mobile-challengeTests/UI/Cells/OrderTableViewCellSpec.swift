//
//  OrderTableViewCellSpec.swift
//  mobile-challengeTests
//
//  Created by Brendoon Ryos on 12/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Quick
import Nimble

@testable import mobile_challenge

class OrderTableViewCellSpec: QuickSpec {
  override func spec() {
    describe("an OrderTableViewCell") {
      var cell: OrderTableViewCell!
      var order: Order!
      
      beforeEach {
        let sampleData = MoipAPI.fetchOrders(token: "", offset: 1).sampleData
        let ordersResponse = try? JSONDecoder().decode(OrdersResponse.self, from: sampleData)
        order = ordersResponse?.orders.first
        
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        
        tableView.register(cellType: OrderTableViewCell.self)
        
        cell = tableView.dequeueReusableCell(for: IndexPath(row: 0, section: 0), cellType: OrderTableViewCell.self)
        cell.setup(with: order)
      }
      
      it("should not be nil") {
        expect(cell).toNot(beNil())
      }
      
      it("should have expected height") {
        expect(OrderTableViewCell.height()).to(equal(80))
      }
      
      it("should have expected selection style") {
        expect(cell.selectionStyle == .gray).to(beTruthy())
      }
      
      it("should have expected email after setup") {
        expect(cell.emailLabel.text).to(equal(order.customer.email))
      }
      
      it("should have expected updateAt after setup") {
        expect(cell.updatedAtLabel.text).to(equal(Date.getFormattedDate(string: order.updatedAt)))
      }
      
      it("should have expected status after setup") {
        expect(cell.statusLabel.text).to(equal(Status(rawValue: order.status.lowercased())!.name))
      }
      
      it("should have expected ownId after setup") {
        expect(cell.ownIdLabel.text).to(equal("sandbox:" + order.ownId))
      }
      
      it("should have expected total amount after setup") {
        expect(cell.totalAmountLabel.text).to(equal(Double.toCurrency(value: Double(order.amount.total))))
      }
      
      it("should have expected method after setup") {
        expect(cell.methodImageView.image).to(equal(UIImage(named: Method(rawValue: order.payments.first!.fundingInstrument!.method.lowercased())!.description)))
      }
    }
  }
}
