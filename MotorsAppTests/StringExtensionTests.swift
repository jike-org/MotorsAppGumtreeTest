//
//  StringExtensionTests.swift
//  MotorsAppTests
//
//  Created by Stephen Clark on 31/05/2022.
//

import XCTest

@testable import MotorsApp

class StringExtensionTests: XCTestCase {

    func test_stringExtensionForLettersOrNumber_CorrectlyDetectsCompatibleString() throws {
        let testStringOne = "This is a string with spaces"
        let testStringTwo = "ThisStringHasSymbols!@£$%^&*"
        let testStringThree = "ThisStringIsFine"
        let testStringFour = "This1String2Is3Fine"
        let testStringFive = "12345"
        
        XCTAssert(testStringOne.isAlphabeticOrNumericOrBoth == false)
        XCTAssert(testStringTwo.isAlphabeticOrNumericOrBoth == false)
        XCTAssert(testStringThree.isAlphabeticOrNumericOrBoth == true)
        XCTAssert(testStringFour.isAlphabeticOrNumericOrBoth == true)
        XCTAssert(testStringFive.isAlphabeticOrNumericOrBoth == true)
    }
}
