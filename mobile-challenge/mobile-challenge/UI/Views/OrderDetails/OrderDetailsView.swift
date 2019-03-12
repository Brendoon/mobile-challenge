//
//  OrderDetailsView.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 11/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class OrderDetailsView: UIView {
  lazy var activityIndicator: UIActivityIndicatorView = {
    let view = UIActivityIndicatorView(style: .whiteLarge)
    view.color = ColorPalette.blue
    return view
  }()
  
  lazy var tableView: OrderDetailsTableView = {
    let view = OrderDetailsTableView()
    view.separatorStyle = .none
    view.alwaysBounceVertical = false
    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViewCode()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension OrderDetailsView: ViewCode {
  func buildViewHierarchy() {
    addSubview(tableView)
    addSubview(activityIndicator)
  }
  
  func setupConstraints() {
    tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    activityIndicator.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  func configureViews() {
    backgroundColor = ColorPalette.white
  }
}
