//
//  PaymentsTableViewCellSpec.swift
//  mobile-challengeTests
//
//  Created by Brendoon Ryos on 12/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Quick
import Nimble

@testable import mobile_challenge

class PaymentsTableViewCellSpec: QuickSpec {
  override func spec() {
    describe("a PaymentsTableViewCell") {
      var cell: PaymentsTableViewCell!
      var order: Order!
      
      beforeEach {
        let sampleData = MoipAPI.fetchOrder(token: "", id: "").sampleData
        order = try? JSONDecoder().decode(Order.self, from: sampleData)
        
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        
        tableView.register(cellType: PaymentsTableViewCell.self)
        
        cell = tableView.dequeueReusableCell(for: IndexPath(row: 0, section: 0), cellType: PaymentsTableViewCell.self)
        cell.setup(with: order)
      }
      
      it("should not be nil") {
        expect(cell).toNot(beNil())
      }
      
      it("should have expected height") {
        expect(PaymentsTableViewCell.height()).to(equal(100))
      }
      
      it("should have expected selection style") {
        expect(cell.selectionStyle == .none).to(beTruthy())
      }
      
      it("should have expected fees after setup") {
        let countString: String
        if order.payments.count > 1 {
          countString = "\(order.payments.count) pagamentos"
        } else {
          countString = "\(order.payments.count) pagamento"
        }
        expect(cell.paymentsCountLabel.text).to(equal(countString))
      }
    }
  }
}
