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
        
        
        let appearance = UINavigationBar.appearance()
        let primaryTintColor = UIColor.Theme.mainColor
        
        appearance.isOpaque = true
        appearance.tintColor = UIColor.white
        appearance.barTintColor = primaryTintColor
        appearance.backgroundColor = primaryTintColor
        
        // This code extends bar color under top data / time area
        // for newer version of iOS and device form factors.
        
        let nonDotBarApperance = UINavigationBarAppearance()
        nonDotBarApperance.configureWithOpaqueBackground()
        nonDotBarApperance.titleTextAttributes =  [.foregroundColor: UIColor.white,
                                                   NSAttributedString.Key.font: BumpFontSizes ? UIFont.Bold.size7 : UIFont.Bold.size6]
        nonDotBarApperance.backgroundColor = primaryTintColor
        appearance.standardAppearance = nonDotBarApperance
        appearance.scrollEdgeAppearance = nonDotBarApperance
        
        nonDotBarApperance.configureWithOpaqueBackground()
        nonDotBarApperance.backgroundColor = UIColor.Theme.mainColor
        
        let attrs: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.Bold.size4
        ]
    
        nonDotBarApperance.largeTitleTextAttributes = attrs
        appearance.scrollEdgeAppearance = nonDotBarApperance
 
        
        // Attributes for page title
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white,
                                          NSAttributedString.Key.font: BumpFontSizes ? UIFont.Bold.size7 : UIFont.Bold.size6]

        appearance.barStyle = .black
        appearance.isTranslucent = false

        // BarButtonItem Set a custom back button image to replace default back arrow

        let backButtonImage = #imageLiteral(resourceName: "icnBackChevronWhite").withRenderingMode(.alwaysOriginal)
        
        // Move image position
        UIGraphicsBeginImageContextWithOptions(CGSize(width: (backButtonImage.size.width - 10),
                                                      height: (backButtonImage.size.height - 5)), false, 0)
        backButtonImage.draw(at: CGPoint(x: -8, y: -1))
        let finalImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // Now set the back image to the adjusted image
        appearance.backIndicatorImage = finalImage
        appearance.backIndicatorTransitionMaskImage = finalImage
        appearance.setBackgroundImage(UIImage(), for: .default)
        
        appearance.isTranslucent = false

        // BarButtonItem attributes at the top left and right of our view controllers
        let attributes = [.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: BumpFontSizes ? UIFont.Body.size4 : UIFont.Body.size3] // sizeed
        let barButtonAppearance = UIBarButtonItem.appearance()

        barButtonAppearance.setTitleTextAttributes(attributes, for: .application)
        barButtonAppearance.setTitleTextAttributes(attributes, for: .disabled)
        barButtonAppearance.setTitleTextAttributes(attributes, for: .highlighted)
        barButtonAppearance.setTitleTextAttributes(attributes, for: .normal)
        barButtonAppearance.setTitleTextAttributes(attributes, for: .reserved)
        barButtonAppearance.setTitleTextAttributes(attributes, for: .selected)
        barButtonAppearance.setTitleTextAttributes(attributes, for: .focused)
        
    }
}
