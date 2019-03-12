//
//  AmountTableViewCellSpec.swift
//  mobile-challengeTests
//
//  Created by Brendoon Ryos on 12/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Quick
import Nimble

@testable import mobile_challenge

class AmountTableViewCellSpec: QuickSpec {
  override func spec() {
    describe("an AmountTableViewCell") {
      var cell: AmountTableViewCell!
      var order: Order!
      
      beforeEach {
        let sampleData = MoipAPI.fetchOrder(token: "", id: "").sampleData
        order = try? JSONDecoder().decode(Order.self, from: sampleData)
        
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        
        tableView.register(cellType: AmountTableViewCell.self)
        
        cell = tableView.dequeueReusableCell(for: IndexPath(row: 0, section: 0), cellType: AmountTableViewCell.self)
        cell.setup(with: order)
      }
      
      it("should not be nil") {
        expect(cell).toNot(beNil())
      }
      
      it("should have expected height") {
        expect(AmountTableViewCell.height()).to(equal(65))
      }
      
      it("should have expected selection style") {
        expect(cell.selectionStyle == .none).to(beTruthy())
      }
      
      it("should have expected name after setup") {
        expect(cell.idLabel.text).to(equal(order.id))
      }
      
      it("should have expected ownId after setup") {
        expect(cell.ownIdLabel.text).to(equal("sandbox:" + order.ownId))
      }
      
      it("should have expected total amount after setup") {
        expect(cell.totalAmountLabel.text).to(equal(Double.toCurrency(value: Double(order.amount.total))))
      }
      
      it("should have expected method after setup") {
        expect(cell.methodLabel.text).to(equal(Method(rawValue: "boleto")?.description))
      }
    }
  }
}
