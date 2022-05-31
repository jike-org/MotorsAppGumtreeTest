//
//  UIFont+MA.swift
//  MotorsApp
//
//  Created by Stephen Clark on 28/05/2022.
//

import UIKit
import Foundation

let LightFontName = "CoverfaceSELight"
let RegularFontName = "CoverfaceSE"
let BoldFontName = "CoverfaceSE-Bold"

public var BumpFontSizes = UserDefaults.standard.bool(forKey: "UserLargerTextFontSizes")

extension UIFont {
    
    static func sized(_ originalSize: CGFloat) -> CGFloat {
        let sizePlusTwo: CGFloat = originalSize + 2.0
        return BumpFontSizes ? sizePlusTwo : originalSize
    }
    
    struct Light {
        static var size0 = { return UIFont(name: LightFontName, size: sized(10)) ?? UIFont.systemFont(ofSize: sized(10))}()
        static var size1 = { return UIFont(name: LightFontName, size: sized(12)) ?? UIFont.systemFont(ofSize: sized(12))}()
        static var size2 = { return UIFont(name: LightFontName, size: sized(13)) ?? UIFont.systemFont(ofSize: sized(13))}()
        static var size3 = { return UIFont(name: LightFontName, size: sized(14)) ?? UIFont.systemFont(ofSize: sized(14))}()
        static var size4 = { return UIFont(name: LightFontName, size: sized(15)) ?? UIFont.systemFont(ofSize: sized(15))}()
        static var size5 = { return UIFont(name: LightFontName, size: sized(17)) ?? UIFont.systemFont(ofSize: sized(17))}()
    }
    
    struct Body {
        static var size0 = { return UIFont(name: RegularFontName, size: sized(10)) ?? UIFont.systemFont(ofSize: sized(10))}()
        static var size1 = { return UIFont(name: RegularFontName, size: sized(12)) ?? UIFont.systemFont(ofSize: sized(12))}()
        static var size2 = { return UIFont(name: RegularFontName, size: sized(13)) ?? UIFont.systemFont(ofSize: sized(13))}()
        static var size3 = { return UIFont(name: RegularFontName, size: sized(15)) ?? UIFont.systemFont(ofSize: sized(15))}()
        static var size4 = { return UIFont(name: RegularFontName, size: sized(16)) ?? UIFont.systemFont(ofSize: sized(16))}()
        static var size5 = { return UIFont(name: RegularFontName, size: sized(17)) ?? UIFont.systemFont(ofSize: sized(17))}()
        }

        struct Bold {
            static var size0 = { return UIFont(name: BoldFontName, size: sized(12)) ?? UIFont.systemFont(ofSize: sized(12))}()
            static var size1 = { return UIFont(name: BoldFontName, size: sized(14)) ?? UIFont.systemFont(ofSize: sized(14))}()
            static var size2 = { return UIFont(name: BoldFontName, size: sized(15)) ?? UIFont.systemFont(ofSize: sized(15))}()
            static var size3 = { return UIFont(name: BoldFontName, size: sized(16)) ?? UIFont.systemFont(ofSize: sized(16))}()
            static var size4 = { return UIFont(name: BoldFontName, size: sized(18)) ?? UIFont.systemFont(ofSize: sized(18))}()
            static var size5 = { return UIFont(name: BoldFontName, size: sized(20)) ?? UIFont.systemFont(ofSize: sized(20))}()
            static var size6 = { return UIFont(name: BoldFontName, size: sized(22)) ?? UIFont.systemFont(ofSize: sized(22))}()
            static var size7 = { return UIFont(name: BoldFontName, size: sized(24)) ?? UIFont.systemFont(ofSize: sized(24))}()
        }
        struct Button {
            struct Primary {
                static var size1 = { return UIFont(name: BoldFontName, size: sized(14)) ?? UIFont.systemFont(ofSize: sized(14))}()
                static var size2 = { return UIFont(name: BoldFontName, size: sized(16)) ?? UIFont.systemFont(ofSize: sized(16))}()
            }
            struct Secondary {
                static var size0 = { return UIFont(name: RegularFontName, size: sized(12)) ?? UIFont.systemFont(ofSize: sized(12))}()
                static var size1 = { return UIFont(name: RegularFontName, size: sized(15)) ?? UIFont.systemFont(ofSize: sized(15))}()
            }
        }
}
