//
//  MotorsAppApp.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import SwiftUI

@main
struct MotorsAppApp: App {
    
    @StateObject private var carsListViewModel = CarsViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(carsListViewModel)
        }
    }
}
