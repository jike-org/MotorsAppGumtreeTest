//
//  ColorExtensionTests.swift
//  MotorsAppTests
//
//  Created by Stephen Clark on 31/05/2022.
//

import XCTest

@testable import MotorsApp

class ColorExtensionTests: XCTestCase {


    func test_ThemeColor_IsCorrectlyGenerated() throws {
        // Given
        let color = UIColor.Theme.mainColor
        // When
        let extractBackTheHexString = color.hexString
        // Then
        XCTAssertEqual(extractBackTheHexString, "#69B783")
    }

    func test_OtherColors_AreCorrect() throws {
        // Given
        let color = UIColor.Font.Body.placeholder
        
        // When
        let colorFromDescription = UIColor(white: 2/3, alpha: 1) // .lightGray is "A color object with a grayscale value of 2/3 and an alpha value of 1.0"
        let extractTheHexString = color.hexString
        
        // Then
        XCTAssertEqual(extractTheHexString, "#AAAAAA")
        XCTAssertEqual(colorFromDescription, color)
    }
}
