//
//  OrderDetailsViewControllerSpec.swift
//  mobile-challengeTests
//
//  Created by Brendoon Ryos on 12/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Quick
import Nimble
import Moya
import Alamofire

@testable import mobile_challenge

class OrderDetailsViewControllerSpec: QuickSpec {
  override func spec() {
    describe("a OrderDetailsViewController") {
      var controller: OrderDetailsViewController!
      var order: Order!
      var worker: OrderDetailsWorker!
      var interactor: OrderDetailsInteractor!
      
      beforeEach {
        let sampleData = MoipAPI.fetchOrder(token: "", id: "").sampleData
        order = try? JSONDecoder().decode(Order.self, from: sampleData)
        controller = OrderDetailsViewController()
        worker = OrderDetailsWorker(networkManager: NetworkManagerMock())
        interactor = OrderDetailsInteractor(worker: worker)
        interactor.orderId = ""
        interactor.token = ""
        controller.interactor = interactor
        controller.fetchOrderDetails()
      }
      
      it("should have an order") {
        expect(order).toNot(beNil())
      }
      
      it("should be able to create a controller") {
        expect(controller).toNot(beNil())
      }
      
      it("should have a view of type") {
        expect(controller.view).to(beAKindOf(OrderDetailsView.self))
      }
      
      it("should have a initial state") {
        expect(controller.orderDetailsView.activityIndicator.isAnimating).to(beTrue())
      }
      
      it("should have changed the initial state") {
        controller.displayOrderDetails(viewModel: Orders.Details.ViewModel(order: order))
        expect(controller.orderDetailsView.activityIndicator.isAnimating).toNot(beTrue())
      }
      
      it("should trigger fatal error if init with coder") {
        #if arch(x86_64)
        expect { () -> Void in
          let _ = OrderDetailsViewController(coder: NSCoder())
          }.to(throwAssertion())
        #endif
      }
    }
  }
}
