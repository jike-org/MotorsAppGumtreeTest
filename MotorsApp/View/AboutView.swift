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
                  
                 // Spacer(minLength: 10)
                  
                  AppInfoView()
                  
                  //Spacer(minLength: 10)
                  
              }
              .frame(minWidth: 0, maxWidth: .infinity)
              .padding(.top, 15)
              .padding(.bottom, 25)
              .padding(.horizontal, 25)
          }.navigationBarTitle(Text("Info"))
          
      }.navigationViewStyle(.stack)
  }
}

struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    AboutView()
  }
}
