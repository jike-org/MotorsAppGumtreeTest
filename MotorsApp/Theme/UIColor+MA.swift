//
//  UIColor+MA.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import UIKit
import Foundation
import SwifterSwift

// MARK: - Shared Colors
extension UIColor {
    
    struct Theme {
        static var mainColor = UIColor(hexString: "#69b783")!
    }
    
    struct TextField {
        static var borderColor = UIColor.lightGray
        static var borderlessBackground = UIColor.white // or clear
    }
    
    struct Font {
        struct Body {
            static var placeholder = UIColor.lightGray
            static var textViewText = UIColor.black //UIColor.Theme.mainColor
        }
    }
}
