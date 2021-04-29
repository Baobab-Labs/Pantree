//
//  FoodTests.swift
//  PantreeTests
//
//  Created by Ben Hollar on 4/16/21.
//

import XCTest
@testable import Pantree

class FoodTests: XCTestCase {
 
    func testInitNoNutrition() throws {
        let food = Food(named: "Butter")
        XCTAssertEqual(food.name, "Butter")
        XCTAssertNil(food.canonicalMeasurement)
        XCTAssertNil(food.canonicalNutrition)
    }
    
    func testInitWithNutrition() throws {
        let nutrition = Nutrition(calories: 102,
                                  totalFat: 11.52,
                                  saturatedFat: 7.29,
                                  transFat: 0,
                                  cholesterol: 30.53,
                                  sodium: 1.56,
                                  carbohydrates: 0.01,
                                  fiber: 0,
                                  sugar: 0.01,
                                  protein: 0.12)
        let food = Food(named: "Butter",
                        canonicalNutrition: nutrition,
                        canonicalMeasurement: Measurement<UnitFood>(value: 1, unit: .tablespoon))
        XCTAssertEqual(food.name, "Butter")
        XCTAssertEqual(food.canonicalNutrition, nutrition)
        XCTAssertEqual(food.canonicalMeasurement?.value, 1)
        XCTAssertEqual(food.canonicalMeasurement?.unit, .tablespoon)
    }
    
}
