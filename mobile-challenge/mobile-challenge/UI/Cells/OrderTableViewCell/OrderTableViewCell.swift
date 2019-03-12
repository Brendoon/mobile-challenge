//
//  OrderTableViewCell.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 07/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit
import Reusable

enum Method: String {
  case boleto
  case credit_card
  
  var description: String {
    switch self {
    case .boleto:
      return "Boleto"
    case .credit_card:
      return "Cartão de Crédito"
    }
  }
}

enum Status: String {
  case paid
  case waiting
  case not_paid
  case reverted
  
  var name: String {
    switch self {
    case .paid:
      return "PAGO"
    case .waiting:
      return "AGUARDANDO"
    case .not_paid:
      return "NÃO PAGO"
    case .reverted:
      return "ESTORNADO"
    }
  }
  
  var color: UIColor {
    switch self {
    case .paid:
      return UIColor(hex: "64A71A")
    case .waiting:
      return UIColor(hex: "FFC108")
    case .not_paid:
      return UIColor(hex: "F44336")
    case .reverted:
      return .gray
    }
  }
}

class OrderTableViewCell: UITableViewCell, NibReusable {
  
  @IBOutlet weak var methodImageView: UIImageView!
  @IBOutlet weak var emailLabel: UILabel!
  @IBOutlet weak var updatedAtLabel: UILabel!
  @IBOutlet weak var statusLabel: UILabel!
  @IBOutlet weak var totalAmountLabel: UILabel!
  @IBOutlet weak var ownIdLabel: UILabel!
  
  static func height() -> CGFloat {
    return 80.0
  }
  
  func setup(with item: Order) {
    let method = Method(rawValue: item.payments.first?.fundingInstrument?.method.lowercased() ?? "boleto")
    methodImageView.image = UIImage(named: method!.description)
    emailLabel.text = item.customer.email
    updatedAtLabel.text = Date.getFormattedDate(string: item.updatedAt)
    let status = Status(rawValue: item.status.lowercased())
    statusLabel.text = status?.name
    statusLabel.textColor = status?.color
    statusLabel.layer.borderColor = status?.color.cgColor
    totalAmountLabel.text = Double.toCurrency(value: Double(item.amount.total), code: item.amount.currency)
    ownIdLabel.text = "sandbox:" + item.ownId
  }
}
