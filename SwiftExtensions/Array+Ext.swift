//
//  Array+Ext.swift
//  SwiftExtensions
//
//  Created by Chuck Perdue on 4/18/24.
//

import Foundation

extension Array where Element: Hashable {
  func removingDuplicates() -> [Element] {
    // Swift 5.6
    //https://www.hackingwithswift.com/example-code/language/how-to-remove-duplicate-items-from-an-array
    var addedDict = [Element: Bool]()
    
    return filter {
      addedDict.updateValue(true, forKey: $0) == nil
    }
  }
  
  mutating func removeDuplicates() {
    self = self.removingDuplicates()
  }
}
