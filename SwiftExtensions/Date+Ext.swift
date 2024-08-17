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
  
  /// Returns an integer of the specified  date component
  /// - Parameter type: Calendar.Component
  /// - Returns: Returns an integer of the specified  date component
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
  
  static func from(year: Int, month: Int, day: Int) -> Date {
    let components = DateComponents(year: year, month: month, day: day)
    return Calendar.current.date(from: components)!
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
  
  var randomTime: Date {
    let minutes = Int.random(in: 1...59)
    let hour = Int.random(in: 1...23)
    return Calendar.current.date(bySettingHour: hour, minute: minutes, second: 0, of: self)!
  }
  
  static var yesterday: Date { return Date().dayBefore }
  static var tomorrow:  Date { return Date().dayAfter }
  var dayBefore: Date {
    return Calendar.current.date(byAdding: .day, value: -1, to: midNight)!
  }
  var dayAfter: Date {
    return Calendar.current.date(byAdding: .day, value: 1, to: midNight)!
  }
  var noon: Date {
    return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
  }
  
  var midNight: Date {
    return Calendar.current.date(bySettingHour: 23, minute: 59, second: 0, of: self)!
  }
  
  var month: Int {
    return Calendar.current.component(.month,  from: self)
  }
  var isLastDayOfMonth: Bool {
    return dayAfter.month != month
  }
  
  var startOfDay: Date {
    return Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: self)!
  }
  
  var endOfDay: Date {
    return Calendar.current.date(bySettingHour: 23, minute: 59, second: 0, of: self)!
  }
  
  var startOfMonth: Date {
    
    let calendar = Calendar(identifier: .gregorian)
    let components = calendar.dateComponents([.year, .month], from: self)
    
    return  calendar.date(from: components)!
  }
  
  var endOfMonth: Date {
    var components = DateComponents()
    components.month = 1
    components.second = -1
    return Calendar(identifier: .gregorian).date(byAdding: components, to: startOfMonth)!
  }
}
