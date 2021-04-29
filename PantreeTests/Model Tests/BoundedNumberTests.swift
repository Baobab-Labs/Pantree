//
//  BoundedNumberTests.swift
//  PantreeTests
//
//  Created by Ben Hollar on 4/16/21.
//

import XCTest

@testable import Pantree
class BoundedNumberTests: XCTestCase {
    
    // MARK: - Test Models
    
    struct ValidBoundsTestModel {
        @BoundedNumber(minimum: 0, maximum: 100) var value: Double? = nil
    }
    
    struct ValidBoundsMinOnlyTestModel {
        @BoundedNumber(minimum: 0) var value: Double? = nil
    }
    
    struct ValidBoundsMaxOnlyTestModel {
        @BoundedNumber(maximum: 100) var value: Double? = nil
    }
    
    struct InvalidBoundsTestModel {
        @BoundedNumber(minimum: 1, maximum: 0) var value: Double? = nil
    }
    
    // MARK: - Tests
    
    func testMinBounds() {
        let boundedNumber1 = ValidBoundsTestModel(value: -1)
        XCTAssertEqual(boundedNumber1.value, 0)
        
        let boundedNumber2 = ValidBoundsMinOnlyTestModel(value: -1)
        XCTAssertEqual(boundedNumber2.value, 0)
    }
    
    func testMaxBounds() {
        let boundedNumber1 = ValidBoundsTestModel(value: 200)
        XCTAssertEqual(boundedNumber1.value, 100)
        
        let boundedNumber2 = ValidBoundsMaxOnlyTestModel(value: 200)
        XCTAssertEqual(boundedNumber2.value, 100)
    }
    
    func testWithinBounds() {
        let boundedNumber1 = ValidBoundsTestModel(value: 50)
        XCTAssertEqual(boundedNumber1.value, 50)
        
        let boundedNumber2 = ValidBoundsMinOnlyTestModel(value: 1e6)
        XCTAssertEqual(boundedNumber2.value, 1e6)
        
        let boundedNumber3 = ValidBoundsMaxOnlyTestModel(value: -1e6)
        XCTAssertEqual(boundedNumber3.value, -1e6)
    }

    func testInvalidBounds() throws {
        let boundedNumber = InvalidBoundsTestModel(value: 2)
        XCTAssertEqual(boundedNumber.value, nil)
    }

}
