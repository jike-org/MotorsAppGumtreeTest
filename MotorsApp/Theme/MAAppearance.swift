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
        setupTabBarApperance()
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

        let selectedIconColor = UIColor.white

        if #available(iOS 15, *) {

            let appearance = UITabBarAppearance()
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = UIColor.Theme.mainColor

            appearance.stackedLayoutAppearance.normal.iconColor = .darkGray
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.darkGray,
                                                                             .font: UIFont.Light.size0]

            appearance.stackedLayoutAppearance.selected.iconColor = selectedIconColor
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: selectedIconColor,
                                                                               .font: UIFont.Body.size0]

            let appearanceTab = UITabBar.appearance()

            appearanceTab.standardAppearance = appearance
            appearanceTab.scrollEdgeAppearance = appearance
        }
        
    }
    
    static func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.Theme.mainColor 

        let attrs: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.Bold.size4
        ]

        appearance.largeTitleTextAttributes = attrs

        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
