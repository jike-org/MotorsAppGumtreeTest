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
        let appearance = UITabBar.appearance()
        
        let themePrimaryColor = UIColor.init(hexString: "#69b783")
        let selectedIconColor = UIColor.white
        appearance.isOpaque = true
        appearance.tintColor = UIColor.white
        appearance.barTintColor = UIColor.white
        appearance.backgroundColor = themePrimaryColor //UIColor.init(hexString: "#69b783")//UIColor.black//.systemBackground
        
        
        if #available(iOS 15, *) {
             let appearance = UITabBarAppearance()
             appearance.configureWithDefaultBackground()
             appearance.backgroundColor = themePrimaryColor
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
        appearance.backgroundColor = UIColor.init(hexString: "#69b783")

        let attrs: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.monospacedSystemFont(ofSize: 25, weight: .black)
        ]

        appearance.largeTitleTextAttributes = attrs

        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
