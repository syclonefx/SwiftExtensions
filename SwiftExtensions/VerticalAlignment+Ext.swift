//
//  VerticalAlignment+Ext.swift
//  SwiftExtensions
//
//  Created by Chuck Perdue on 5/7/24.
//

import SwiftUI

extension VerticalAlignment {
  struct MidAccountAndName: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
      context[.top]
    }
  }
  
  static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}
