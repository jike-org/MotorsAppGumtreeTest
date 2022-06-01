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
            RowAppInfoView(ItemOne: "Version", ItemTwo: "1.0.0")
            HStack {
                Text("Website: ").font(Font(UIFont.Body.size1)).foregroundColor(Color.gray)
                Spacer()
                Text("[steveclarkapps.com](https://www.steveclarkapps.com)")
            }
        }
    }
}

struct AppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoView().previewLayout(.sizeThatFits)
    }
}
