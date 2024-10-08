//
//  View+Ext.swift
//  SwiftExtensions
//
//  Created by Chuck Perdue on 4/24/24.
//

import SwiftUI


struct ViewPreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

extension View {
  func getSize(size: @escaping (CGSize) -> Void) -> some View {
    background(
      GeometryReader { geo in
        Color.clear
          .preference(key: ViewPreferenceKey.self, value: geo.size)
      }
    )
    .onPreferenceChange(ViewPreferenceKey.self, perform: size)
  }
  
  
}

