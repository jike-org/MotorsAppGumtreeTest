//
//  TitleModifier.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import SwiftUI

struct TitleModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.largeTitle)
      .foregroundColor(Color(UIColor.Theme.mainColor))
  }
}
