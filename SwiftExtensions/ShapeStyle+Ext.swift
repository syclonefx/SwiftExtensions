//
//  ShapeStyle+Ext.swift
//  SwiftExtensions
//
//  Created by Chuck Perdue on 4/15/24.
//

import SwiftUI

extension ShapeStyle where Self == Color {
  // https://www.hackingwithswift.com/
  static var darkBackground: Color {
    Color(red: 0.1, green: 0.1, blue: 0.2)
  }
  
  static var lightBackground: Color {
    Color(red: 0.2, green: 0.2, blue: 0.3)
  }
}
