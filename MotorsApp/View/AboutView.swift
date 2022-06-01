//
//  InfoView.swift
//  MotorsApp
//
//  Created by Stephen Clark on 29/05/2022.
//

import SwiftUI
import Foundation


struct AboutView: View {
  // MARK: - PROPERTIES
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
      
      NavigationView {
          ScrollView(.vertical, showsIndicators: false) {
              VStack(alignment: .center, spacing: 20) {
                  HeaderComponent()
                  Spacer(minLength: 10)
                  AppInfoView()
              }
              .modifier(ScrollViewModifier())
          }.navigationBarTitle(Text("Info"))
          
      }.navigationViewStyle(.stack)
  }
}

struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    AboutView()
  }
}
