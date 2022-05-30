//
//  HeaderComponent.swift
//  MotorsApp
//
//  Created by Stephen Clark on 29/05/2022.
//

import SwiftUI
import Foundation

struct HeaderComponent: View {
  var body: some View {
    VStack(alignment: .center, spacing: 20) {      
      Image("motorsLogo")
        .resizable()
        .scaledToFit()
        .frame(height: 80)
    }
  }
}

struct HeaderComponent_Previews: PreviewProvider {
  static var previews: some View {
    HeaderComponent()
      .previewLayout(.fixed(width: 375, height: 128))
  }
}
