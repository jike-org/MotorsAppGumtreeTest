//
//  RowAppInfoView.swift
//  MotorsApp
//
//  Created by Stephen Clark on 29/05/2022.
//

import SwiftUI

struct RowAppInfoView: View {
  // MARK: - PROPERTIES
  var ItemOne: String
  var ItemTwo: String
  
  var body: some View {
    VStack {
      HStack {
        Text(ItemOne).foregroundColor(Color.gray)
        Spacer()
        Text(ItemTwo)
      }
      Divider()
    }
  }
}

struct RowAppInfoView_Previews: PreviewProvider {
  static var previews: some View {
      RowAppInfoView(ItemOne: "Item One", ItemTwo: "Item Two")
          .previewLayout(.fixed(width: 375, height: 128))
  }
}
