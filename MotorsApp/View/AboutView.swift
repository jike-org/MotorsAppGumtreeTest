//
//  AboutView.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("""
                **MotorsApp**\n
                *Stephen M. Clark*\n
                Visit My Website: [ here](https://www.steveclarkapps.com)
                """).multilineTextAlignment(.center)
                
            }.navigationBarTitle(Text("About"))
        }.navigationViewStyle(.stack)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
