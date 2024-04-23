//
//  String+Ext.swift
//  SwiftExtensions
//
//  Created by Chuck Perdue on 4/15/24.
//

import Foundation

extension String {
  func convertToDate() -> Date? {
    // input: Monday, April 15, 2024
    // output: 2024-04-15 04:00:00 +0000
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE, MMMM dd, yyyy"
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.timeZone = .current
    
    return dateFormatter.date(from: self)
  }
  
  func convertToDateWithFormat(format: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.timeZone = .current
    
    return dateFormatter.date(from: self)
  }
}
