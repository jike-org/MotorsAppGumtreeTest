//
//  SearchView.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var carsListVM = CarsViewModel()
//    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            List {
//                Text("""
//            **MotorsApp**\n
//            *Stephen M. Clark*\n
//            Visit My Website: [ here](https://www.steveclarkapps.com)
//            """).multilineTextAlignment(.center)
                
            }.navigationBarTitle(Text("Search"))
            .listStyle(.plain)
            .searchable(text: $carsListVM.searchText)

//            .onChange(of: carsListVM.searchText, perform: { newValue in
//                    print(newValue)
//                })
        }.navigationViewStyle(.stack)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
