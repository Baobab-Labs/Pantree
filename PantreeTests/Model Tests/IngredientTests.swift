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
        
        var ingredient = Ingredient(food, amount: food.canonicalMeasurement!)
        XCTAssertEqual(ingredient.nutrition, food.canonicalNutrition!)
        
        ingredient.amount = Measurement<UnitFood>(value: 100, unit: UnitFood.baseUnit())
        XCTAssertEqual(ingredient.nutrition, nutrition * (100 / 14.7868)) // 100g / grams-per-tablespoon
    }
    
    func testNilNutritionCalculation() throws {
        let food = Food(named: "Butter")
        let ingredient = Ingredient(food, amount: Measurement<UnitFood>(value: 100, unit: .gram))
        XCTAssertNil(ingredient.nutrition)
    }

}
