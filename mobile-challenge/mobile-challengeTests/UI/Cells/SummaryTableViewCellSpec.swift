//
//  SummaryTableViewCellSpec.swift
//  mobile-challengeTests
//
//  Created by Brendoon Ryos on 12/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Quick
import Nimble

@testable import mobile_challenge

class SummaryTableViewCellSpec: QuickSpec {
  override func spec() {
    describe("a SummaryTableViewCell") {
      var cell: SummaryTableViewCell!
      var order: Order!
      
      beforeEach {
        let sampleData = MoipAPI.fetchOrder(token: "", id: "").sampleData
        order = try? JSONDecoder().decode(Order.self, from: sampleData)
        
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        
        tableView.register(cellType: SummaryTableViewCell.self)
        
        cell = tableView.dequeueReusableCell(for: IndexPath(row: 0, section: 0), cellType: SummaryTableViewCell.self)
        cell.setup(with: order)
      }
      
      it("should not be nil") {
        expect(cell).toNot(beNil())
      }
      
      it("should have expected height") {
        expect(SummaryTableViewCell.height()).to(equal(140))
      }
      
      it("should have expected selection style") {
        expect(cell.selectionStyle == .none).to(beTruthy())
      }
      
      it("should have expected fees after setup") {
        expect(cell.feesLabel.text).to(equal("- " + Double.toCurrency(value: Double(order.amount.fees))!))
      }
      
      it("should have expected liquid after setup") {
        expect(cell.liquidLabel.text).to(equal("= " + Double.toCurrency(value: Double(order.amount.liquid ?? 0))!))
      }
      
      it("should have expected total amount after setup") {
        expect(cell.totalAmountLabel.text).to(equal("+ " + Double.toCurrency(value: Double(order.amount.total))!))
      }
    }
  }
}
