//
//  UIView+Gradient.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 07/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

// MARK: Gradient Stuffs
typealias GradientPoints = (startPoint: CGPoint, endPoint: CGPoint)

enum GradientOrientation {
  case bottomRightTopLeft
  case topRightBottomLeft
  case topLeftBottomRight
  case horizontal
  case vertical
  
  var startPoint: CGPoint {
    return points.startPoint
  }
  
  var endPoint: CGPoint {
    return points.endPoint
  }
  
  var points: GradientPoints {
    switch self {
    case .bottomRightTopLeft:
      return (CGPoint.init(x: 1, y: 1), CGPoint.init(x: 0.0, y: 0.0))
    case .topRightBottomLeft:
      return (CGPoint.init(x: 0.0, y: 1.0), CGPoint.init(x: 1.0, y: 0.0))
    case .topLeftBottomRight:
      return (CGPoint.init(x: 0.0, y: 0.0), CGPoint.init(x: 1, y: 1))
    case .horizontal:
      return (CGPoint.init(x: 0.0, y: 0.5), CGPoint.init(x: 1.0, y: 0.5))
    case .vertical:
      return (CGPoint.init(x: 0.0, y: 0.0), CGPoint.init(x: 0.0, y: 1.0))
    }
  }
}

extension UIView {
  
  func applyGradient(withColours colours: [UIColor], locations: [NSNumber]? = nil) {
    let gradient: CAGradientLayer = CAGradientLayer()
    gradient.frame = self.bounds
    gradient.colors = colours.map { $0.cgColor }
    gradient.locations = locations
    self.layer.insertSublayer(gradient, at: 0)
  }
  
  func applyGradient(withColours colours: [UIColor], gradientOrientation orientation: GradientOrientation) {
    let gradient: CAGradientLayer = CAGradientLayer()
    gradient.frame = self.bounds
    gradient.colors = colours.map { $0.cgColor }
    gradient.startPoint = orientation.startPoint
    gradient.endPoint = orientation.endPoint
    self.layer.insertSublayer(gradient, at: 0)
  }
}
