//
//  StatusTableViewCellSpec.swift
//  mobile-challengeTests
//
//  Created by Brendoon Ryos on 12/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Quick
import Nimble

@testable import mobile_challenge

class StatusTableViewCellSpec: QuickSpec {
  override func spec() {
    describe("a StatusTableViewCell") {
      var cell: StatusTableViewCell!
      var order: Order!
      
      beforeEach {
        let sampleData = MoipAPI.fetchOrder(token: "", id: "").sampleData
        order = try? JSONDecoder().decode(Order.self, from: sampleData)
        
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        
        tableView.register(cellType: StatusTableViewCell.self)
        
        cell = tableView.dequeueReusableCell(for: IndexPath(row: 0, section: 0), cellType: StatusTableViewCell.self)
        cell.setup(with: order)
      }
      
      it("should not be nil") {
        expect(cell).toNot(beNil())
      }
      
      it("should have expected height") {
        expect(StatusTableViewCell.height()).to(equal(75))
      }
      
      it("should have expected selection style") {
        expect(cell.selectionStyle == .none).to(beTruthy())
      }
      
      it("should have expected createdAt after setup") {
        expect(cell.createdAtLabel.text).to(equal(Date.getFormattedDate(string: order.createdAt)))
      }
      
      it("should have expected updatedAt after setup") {
        expect(cell.updatedAtLabel.text).to(equal(Date.getFormattedDate(string: order.updatedAt)))
      }
      
      it("should have expected status after setup") {
        expect(cell.statusLabel.text).to(equal(Status.init(rawValue: order.status.lowercased())!.name))
      }
    }
  }
}
