//
//  OrdersViewControllerSpec.swift
//  mobile-challengeTests
//
//  Created by Brendoon Ryos on 11/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Quick
import Nimble

@testable import mobile_challenge

class OrdersViewControllerSpec: QuickSpec {
  override func spec() {
    describe("a OrdersViewController") {
      var controller: OrdersViewController!
      var ordersResponse: OrdersResponse!
      var worker: OrdersWorker!
      var interactor: OrdersInteractor!
      
      beforeEach {
        let sampleData = MoipAPI.fetchOrders(token: "", offset: 1).sampleData
        ordersResponse = try? JSONDecoder().decode(OrdersResponse.self, from: sampleData)
        controller = OrdersViewController()
        worker = OrdersWorker(networkManager: NetworkManagerMock())
        interactor = OrdersInteractor(worker: worker)
        controller.interactor = interactor
        controller.fetchOrders()
      }
      
      it("should have an order") {
        expect(ordersResponse).toNot(beNil())
      }
      
      it("should be able to create a controller") {
        expect(controller).toNot(beNil())
      }
      
      it("should have a view of type") {
        expect(controller.view).to(beAKindOf(OrdersView.self))
      }
      
      it("should have a initial state") {
        expect(controller.currentCount).to(equal(0))
        expect(controller.ordersView.activityIndicator.isAnimating).to(beTrue())
      }
      
      it("should have changed the initial state") {
        controller.displayOrders(viewModel: Orders.All.ViewModel(ordersResponse: ordersResponse))
        expect(controller.currentCount).to(equal(20))
        expect(controller.ordersView.activityIndicator.isAnimating).toNot(beTrue())
      }
      
      it("should load more cells") {
        expect(controller.isLoadingCell(for: 19)).to(beTrue())
      }
      
      it("should load more cells") {
        controller.didSelectOrder(ordersResponse.orders.first!)
        expect(interactor.orderId).to(equal(ordersResponse.orders.first!.id))
      }
      
      it("should trigger fatal error if init with coder") {
        #if arch(x86_64)
          expect { () -> Void in
            let _ = OrdersViewController(coder: NSCoder())
            }.to(throwAssertion())
        #endif
      }
    }
  }
}
