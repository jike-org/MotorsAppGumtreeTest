//
//  ContentView.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        MAAppearance.setUpApperance()
    }

    var body: some View {
        TabView {
            SearchView()
                .tabItem {
                    Image("icnSearch").renderingMode(.template)
                    Text("Search")
                }
                .tag(1)

            AboutView()
                .tabItem {
                    Image("icnAbout").renderingMode(.template)
                    Text("About")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
