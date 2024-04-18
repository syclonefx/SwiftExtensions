//
//  Date+Ext.swift
//  SwiftExtensions
//
//  Created by Chuck Perdue on 4/15/24.
//

import Foundation

extension Date {
  func toString() -> String{
    // input: 2024-04-16 00:53:49 +0000
    // output: Mon, April 15
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "E, MMMM dd"
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.timeZone = .current
    
    return dateFormatter.string(from: self)
  }
  
  func toStringWithFormat(format: String) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.timeZone = .current
    
    return dateFormatter.string(from: self)
  }
  
  func dateFromString(string: String) -> Date? {
    // https://www.hackingwithswift.com/forums/swift/how-to-convert-string-into-date/14396
    // input: 2022-05-02T00:00+03:00
    let dateFormatter = ISO8601DateFormatter()
    dateFormatter.formatOptions = [.withFullDate]
    let date = dateFormatter.date(from: string)
    
    return date
  }
  
  func convertToMonthDayYear() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy"
    return dateFormatter.string(from: self)
  }
  
  func get(_ type: Calendar.Component) -> Int {
    let calendar = Calendar.current
    return calendar.component(type, from: self)
  }
}
