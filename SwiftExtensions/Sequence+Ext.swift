//
//  Sequence+Ext.swift
//  SwiftExtensions
//
//  Created by Chuck Perdue on 4/30/24.
//

import Foundation

extension Sequence {
  public func random(_ num: Int) -> [Element] {
    Array(shuffled().prefix(num))
  }
}
