//
//  Bundle+Ext.swift
//  SwiftExtensions
//
//  Created by Chuck Perdue on 4/16/24.
//

import Foundation

extension Bundle {
  func decode<T: Codable>(_ file: String, dateFormat: String = "") -> T {
    // https://www.hackingwithswift.com/100/swiftui/39
    // let missions: [Mission] = Bundle.main.decode("missions.json")
    // let missions: [Mission] = Bundle.main.decode("missions.json", dateFormat: "Y-MM-dd")
    guard let url = self.url(forResource: file, withExtension: nil) else {
      fatalError("Failed to locate \(file) in bundle.")
    }
    
    guard let data = try? Data(contentsOf: url) else {
      fatalError("Failed to load \(file) from bundle.")
    }
    
    let decoder = JSONDecoder()
    if dateFormat != "" {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = dateFormat //"Y-MM-dd"
      decoder.dateDecodingStrategy = .formatted(dateFormatter)
    }
    
    do {
      return try decoder.decode(T.self, from: data)
    } catch DecodingError.keyNotFound(let key, let context) {
      fatalError("Failed to decode \(file) from bundle due to a missing key '\(key)' - \(context.debugDescription)")
    } catch DecodingError.typeMismatch(_, let context) {
      fatalError("Failed to decode \(file) from bundle due to a type mismatch - \(context.debugDescription)")
    } catch DecodingError.valueNotFound(let type, let context) {
      fatalError("Failed to decode \(file) from bundle due to missing \(type) - \(context.debugDescription)")
    } catch DecodingError.dataCorrupted(_) {
      fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON.")
    } catch {
      fatalError("Faile to decode \(file) from bundle: \(error.localizedDescription)")
    }
  }
}
