//
//  OrdersTableViewSpec.swift
//  mobile-challengeTests
//
//  Created by Brendoon Ryos on 11/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Quick
import Nimble

@testable import mobile_challenge

class OrdersTableViewSpec: QuickSpec {
  override func spec() {
    describe("a OrdersTableView") {
      
      it("should trigger fatal error if init with coder") {
        #if arch(x86_64)
        expect { () -> Void in
          let _ = OrdersTableView(coder: NSCoder())
          }.to(throwAssertion())
        #endif
      }
    }
  }
}
