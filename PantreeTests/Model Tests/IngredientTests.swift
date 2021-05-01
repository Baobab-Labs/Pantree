//
//  IngredientTests.swift
//  PantreeTests
//
//  Created by Ben Hollar on 4/16/21.
//

import XCTest
@testable import Pantree

class IngredientTests: XCTestCase {

    func testNutritionCalculation() throws {
        let food = Food.stub
        
        var ingredient = Ingredient(food, amount: food.canonicalMeasurement!)
        XCTAssertEqual(ingredient.nutrition, food.canonicalNutrition!)
        
        ingredient.amount = Measurement<UnitFood>(value: 100, unit: UnitFood.baseUnit())
        XCTAssertEqual(ingredient.nutrition, food.canonicalNutrition! * (100 / 14.7868)) // 100g / grams-per-tablespoon
    }
    
    func testNilNutritionCalculation() throws {
        let food = Food(named: "Butter")
        let ingredient = Ingredient(food, amount: Measurement<UnitFood>(value: 100, unit: .gram))
        XCTAssertNil(ingredient.nutrition)
    }

}
