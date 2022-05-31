//
//  ContentView.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        // Setup appearance elements in the app using an apperance proxy
        MAAppearance.setUpApperance()
    }

    var body: some View {
        
        // I've used a tab view structure to organise the sections of the
        // app for the user
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
