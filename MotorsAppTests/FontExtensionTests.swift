//
//  FontExtensionTests.swift
//  MotorsAppTests
//
//  Created by Stephen Clark on 31/05/2022.
//


import XCTest

@testable import MotorsApp

class FontExtensionTests: XCTestCase {

    func test_fontsExtension_ReturnsCustomFontsCorrectly() throws {
        
        // GIVEN
        let fontOne = UIFont.Body.size5
        let fontTwo = UIFont.Bold.size0
        let fontThree = UIFont.Light.size3
        // WHEN
        let sizeOne = fontOne.pointSize
        let nameFontFamOne = fontOne.familyName
        let nameOfFontOne = fontOne.fontName
        
        let sizeTwo = fontTwo.pointSize
        let nameFontFamTwo = fontTwo.familyName
        let nameOfFontTwo = fontTwo.fontName
        
        let sizeThree = fontThree.pointSize
        let nameFontFamThree = fontThree.familyName
        let nameOfFontThree = fontThree.fontName
        
        // THEN
        XCTAssertEqual(sizeOne, 17)
        XCTAssertEqual(nameFontFamOne, "Coverface SE")
        XCTAssertEqual(nameOfFontOne, "CoverfaceSE")
        
        XCTAssertEqual(sizeTwo, 12)
        XCTAssertEqual(nameFontFamTwo, "Coverface SE")
        XCTAssertEqual(nameOfFontTwo, "CoverfaceSE-Bold")
        
        XCTAssertEqual(sizeThree, 14)
        XCTAssertEqual(nameFontFamThree, "Coverface SE")
        XCTAssertEqual(nameOfFontThree, "CoverfaceSELight")
    }
}
