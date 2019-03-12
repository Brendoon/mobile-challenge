//
//  Date+Formatter.swift
//  mobile-challenge
//
//  Created by Brendoon Ryos on 08/03/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation

extension Date {
  static func getFormattedDate(string: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // This formate is input formated .
    
    var formateDate = dateFormatter.date(from: string)
    
    if formateDate == .none {
      dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"
      formateDate = dateFormatter.date(from: string)
    }
    
    dateFormatter.dateFormat = "dd/MM/yyyy" // Output Formated
    
    return dateFormatter.string(from: formateDate!)
  }
}
