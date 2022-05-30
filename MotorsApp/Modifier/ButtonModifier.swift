//
//  ButtonModifier.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.headline)
      .padding()
      .frame(minWidth: 0, maxWidth: .infinity)
      .background(Capsule().fill(Color(UIColor.Theme.mainColor)))
      .foregroundColor(Color.white)
  }
}
