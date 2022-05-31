//
//  String+MA.swift
//  MotorsApp
//
//  Created by Stephen Clark on 31/05/2022.
//

import Foundation

public extension String {
    
    /// Verfiy that a string contains only upper case or lower case letters, and numeric digits.
    var isAlphabeticOrNumericOrBoth: Bool {
        let hasLetters = rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
        let hasNumbers = rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil
        let comps = components(separatedBy: .alphanumerics)
        return comps.joined(separator: "").count == 0 && (hasLetters || hasNumbers)
    }
}
