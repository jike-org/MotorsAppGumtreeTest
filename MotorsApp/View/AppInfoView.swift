//
//  AppInfoView.swift
//  MotorsApp
//
//  Created by Stephen Clark on 29/05/2022.
//

import SwiftUI

struct AppInfoView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      RowAppInfoView(ItemOne: "Application", ItemTwo: "MotorsApp")
      RowAppInfoView(ItemOne: "Compatibility", ItemTwo: "iPhone and iPad")
      RowAppInfoView(ItemOne: "Developer", ItemTwo: "Stephen Clark")
      RowAppInfoView(ItemOne: "Website", ItemTwo: "steveclarkapps.com")
      RowAppInfoView(ItemOne: "Version", ItemTwo: "1.0.0")
    }
  }
}

struct AppInfoView_Previews: PreviewProvider {
  static var previews: some View {
      AppInfoView()
  }
}
