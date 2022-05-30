//
//  MAAppearance.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import UIKit
import Foundation

// To demostrate a mixture of approaches combining UIKit with SwiftUI
// this is an apperance Proxy class which taps into the appearance of
// the UIKit object which SwiftUI uses under the hood.

class MAAppearance {

    /// This method will trigger all the appearance methods
    static func setUpApperance() {
        setupTableView()
//        setupTabBarApperance()
        setupNavigationBar()
    }
    
    static func setupTableView() {
        let tableViewApperance = UITableView.appearance()
        tableViewApperance.separatorInset = UIEdgeInsets.zero
        tableViewApperance.separatorColor = UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 1.00)
    }
    
    // Motors logo color is a green color with a hash something like #69b783
    //
    
    static func setupTabBarApperance() {
        let appearance = UITabBar.appearance()
        
        let selectedIconColor = UIColor.white
        appearance.isOpaque = true
//        appearance.tintColor = UIColor.white
//        appearance.barTintColor = UIColor.white
//        appearance.backgroundColor = UIColor.Theme.mainColor
//
        
        if #available(iOS 15, *) {
             let appearance = UITabBarAppearance()
             appearance.configureWithDefaultBackground()
             appearance.backgroundColor = UIColor.Theme.mainColor
             appearance.stackedLayoutAppearance.normal.iconColor = .darkGray
             appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
             
             appearance.stackedLayoutAppearance.selected.iconColor = selectedIconColor
             appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: selectedIconColor]
             // appearance.backgroundColor = .systemBackground
            let appearanceTab = UITabBar.appearance()

            appearanceTab.standardAppearance = appearance
            appearanceTab.scrollEdgeAppearance = appearance
         }
         
         if #available(iOS 13, *) {
             let appearance = UITabBarAppearance()
             appearance.shadowImage = UIImage()
             appearance.shadowColor = .white
             
             appearance.stackedLayoutAppearance.normal.iconColor = .darkGray
             appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
 //            appearance.stackedLayoutAppearance.normal.badgeBackgroundColor = .yellow
             
             appearance.stackedLayoutAppearance.selected.iconColor = selectedIconColor
             appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: selectedIconColor]
             let appearanceTab = UITabBar.appearance()

             appearanceTab.standardAppearance = appearance
         }
    }
    
    static func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.Theme.mainColor 

        let attrs: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 25, weight: .black)
        ]

        appearance.largeTitleTextAttributes = attrs

        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
