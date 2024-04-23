//
//  Date+Ext.swift
//  SwiftExtensions
//
//  Created by Chuck Perdue on 4/15/24.
//

import Foundation

extension Date {
  
  // Date from string
  func dateFromString(string: String) -> Date? {
    // https://www.hackingwithswift.com/forums/swift/how-to-convert-string-into-date/14396
    // input: 2022-05-02T00:00+03:00
    let dateFormatter = ISO8601DateFormatter()
    dateFormatter.formatOptions = [.withFullDate]
    let date = dateFormatter.date(from: string)
    
    return date
  }
  
  /// Returns an integer of the specifced  date component
  /// - Parameter type: Calendar.Component
  /// - Returns: Returns an integer of the specifced  date component
  func get(_ type: Calendar.Component) -> Int {
    let calendar = Calendar.current
    return calendar.component(type, from: self)
  }
  
  // Date to string conversion
  func convertToMonthDayYear() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy"
    return dateFormatter.string(from: self)
  }
  
  func shortened() -> String {
    formatted(date: .long, time: .shortened)
  }
  
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
  
  // Adding and Subtracting
  func add(hours: Int) -> Date {
      return Calendar(identifier: .gregorian).date(byAdding: .hour, value: hours, to: self)!
  }
  
  func subtract(hours: Int) -> Date {
    return Calendar.current.date(byAdding: .hour, value: -hours, to: self)!
  }
  
  func withAddedHours(hours: Double) -> Date {
       withAddedMinutes(minutes: hours * 60)
  }
  
  func withAddedMinutes(minutes: Double) -> Date {
           addingTimeInterval(minutes * 60)
  }
  
  func withSubtractedHours(hours: Double) -> Date {
       withAddedMinutes(minutes: -(hours * 60))
  }
  
  func withSubtractedMinutes(minutes: Double) -> Date {
           addingTimeInterval(-(minutes * 60))
  }
  
}
