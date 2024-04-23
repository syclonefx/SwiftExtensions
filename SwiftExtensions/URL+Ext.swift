//
//  URL+Ext.swift
//  SwiftExtensions
//
//  Created by Chuck Perdue on 4/19/24.
//

import Foundation

extension URL    {
  func fileExist() -> Bool {
    //https://stackoverflow.com/a/55776987/710793
    FileManager.default.fileExists(atPath: self.path)
  }
  
}

