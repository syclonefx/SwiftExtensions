//
//  Int+Ext.swift
//  SwiftExtensions
//
//  Created by Chuck Perdue on 4/26/24.
//

import Foundation

extension Int {
  
  /// Extension that lets you multiply an Int and a Double
  /// - Parameters:
  ///   - lhs: Int value
  ///   - rhs: Double value
  /// - Returns: Double from multiplying Int * Double
  static func *(lhs: Int, rhs: Double) -> Double {
    // https://www.hackingwithswift.com/guide/ios-swiftui/6/2/key-points
    return Double(lhs) * rhs
  }
}
