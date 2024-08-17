//
//  BinaryInteger.swift
//  SwiftExtensions
//
//  Created by Chuck Perdue on 4/26/24.
//

import Foundation

extension BinaryInteger {
  
  /// Extension that lets you multiply an Int and a Double
  /// - Parameters:
  ///   - lhs: Int value
  ///   - rhs: Double value
  /// - Returns: Double from multiplying Int * Double
  static func *(lhs: Self, rhs: Double) -> Double {
    // Be careful when using this the results could be wrong
    // https://www.hackingwithswift.com/guide/ios-swiftui/6/2/key-points
    return Double(lhs) * rhs
  }
  
  /// Extension that lets you multiply an Int and a Double
  /// - Parameters:
  ///   - lhs: Double value
  ///   - rhs: Int value
  /// - Returns: Double from multiplying Double * Int
  static func *(lhs: Double, rhs: Self) -> Double {
    // Be careful when using this the results could be wrong
    // https://www.hackingwithswift.com/guide/ios-swiftui/6/2/key-points
    return lhs * Double(rhs)
  }
}
