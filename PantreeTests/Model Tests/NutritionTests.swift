//
//  NutritionTests.swift
//  PantreeTests
//
//  Created by Ben Hollar on 4/16/21.
//

import XCTest
@testable import Pantree

class NutritionTests: XCTestCase {
    
    func testZero() throws {
        let zero = Nutrition.zero
        XCTAssertEqual(zero.calories, 0)
        XCTAssertEqual(zero.totalFat, 0)
        XCTAssertEqual(zero.saturatedFat, 0)
        XCTAssertEqual(zero.transFat, 0)
        XCTAssertEqual(zero.cholesterol, 0)
        XCTAssertEqual(zero.sodium, 0)
        XCTAssertEqual(zero.carbohydrates, 0)
        XCTAssertEqual(zero.fiber, 0)
        XCTAssertEqual(zero.sugar, 0)
        XCTAssertEqual(zero.protein, 0)
        
        let nutrition = Nutrition(calories: 540, totalFat: 12, saturatedFat: 5, transFat: 0, cholesterol: 90,
                                  sodium: 680, carbohydrates: 84, fiber: 6, sugar: 20, protein: 28)
        XCTAssertEqual(nutrition + zero, nutrition)
        XCTAssertEqual(nutrition - zero, nutrition)
        XCTAssertEqual(zero + nutrition, nutrition)
        XCTAssertEqual(zero - nutrition, zero)
        XCTAssertEqual(zero * 2, zero)
        XCTAssertEqual(zero / 2, zero)
    }

    func testAdditionNonNil() throws {
        let nutrition1 = Nutrition(calories: 540, totalFat: 12, saturatedFat: 5, transFat: 0, cholesterol: 90,
                                   sodium: 680, carbohydrates: 84, fiber: 6, sugar: 20, protein: 28)
        let nutrition2 = Nutrition(calories: 150, totalFat: 4.5, saturatedFat: 1.5, transFat: 0, cholesterol: 20,
                                   sodium: 610, carbohydrates: 22, fiber: 1, sugar: 5, protein: 6)
        
        let sum = nutrition1 + nutrition2
        
        XCTAssertEqual(sum.calories, 690)
        XCTAssertEqual(sum.totalFat, 16.5)
        XCTAssertEqual(sum.saturatedFat, 6.5)
        XCTAssertEqual(sum.transFat, 0)
        XCTAssertEqual(sum.cholesterol, 110)
        XCTAssertEqual(sum.sodium, 1290)
        XCTAssertEqual(sum.carbohydrates, 106)
        XCTAssertEqual(sum.fiber, 7)
        XCTAssertEqual(sum.sugar, 25)
        XCTAssertEqual(sum.protein, 34)
    }

    func testAdditionWithNils() throws {
        let nutrition1 = Nutrition(calories: 540, totalFat: nil, saturatedFat: 5, transFat: nil, cholesterol: 90,
                                   sodium: 680, carbohydrates: 84, fiber: 6, sugar: 20, protein: 28)
        let nutrition2 = Nutrition(calories: 150, totalFat: 4.5, saturatedFat: 1.5, transFat: nil, cholesterol: 20,
                                   sodium: 610, carbohydrates: 22, fiber: 1, sugar: 5, protein: 6)
        
        let sum = nutrition1 + nutrition2
        
        XCTAssertEqual(sum.calories, 690)
        XCTAssertEqual(sum.totalFat, 4.5)
        XCTAssertEqual(sum.saturatedFat, 6.5)
        XCTAssertEqual(sum.transFat, nil)
        XCTAssertEqual(sum.cholesterol, 110)
        XCTAssertEqual(sum.sodium, 1290)
        XCTAssertEqual(sum.carbohydrates, 106)
        XCTAssertEqual(sum.fiber, 7)
        XCTAssertEqual(sum.sugar, 25)
        XCTAssertEqual(sum.protein, 34)
    }
    
    func testSubtractionNonNil() throws {
        let nutrition1 = Nutrition(calories: 540, totalFat: 12, saturatedFat: 5, transFat: 0, cholesterol: 90,
                                   sodium: 680, carbohydrates: 84, fiber: 6, sugar: 20, protein: 28)
        let nutrition2 = Nutrition(calories: 150, totalFat: 4.5, saturatedFat: 1.5, transFat: 0, cholesterol: 20,
                                   sodium: 610, carbohydrates: 22, fiber: 1, sugar: 5, protein: 6)
        
        let difference = nutrition1 - nutrition2
        
        XCTAssertEqual(difference.calories, 390)
        XCTAssertEqual(difference.totalFat, 7.5)
        XCTAssertEqual(difference.saturatedFat, 3.5)
        XCTAssertEqual(difference.transFat, 0)
        XCTAssertEqual(difference.cholesterol, 70)
        XCTAssertEqual(difference.sodium, 70)
        XCTAssertEqual(difference.carbohydrates, 62)
        XCTAssertEqual(difference.fiber, 5)
        XCTAssertEqual(difference.sugar, 15)
        XCTAssertEqual(difference.protein, 22)
    }
    
    func testSubtractionWithNils() throws {
        let nutrition1 = Nutrition(calories: 540, totalFat: nil, saturatedFat: 5, transFat: nil, cholesterol: 90,
                                   sodium: 680, carbohydrates: 84, fiber: 6, sugar: 20, protein: 28)
        let nutrition2 = Nutrition(calories: 150, totalFat: 4.5, saturatedFat: 1.5, transFat: nil, cholesterol: 20,
                                   sodium: 610, carbohydrates: 22, fiber: 1, sugar: 5, protein: 6)
        
        let sum = nutrition1 - nutrition2
        
        XCTAssertEqual(sum.calories, 390)
        XCTAssertEqual(sum.totalFat, 0) // not a mistake! You can't have negative nutritional values, so clamped to 0
        XCTAssertEqual(sum.saturatedFat, 3.5)
        XCTAssertEqual(sum.transFat, nil)
        XCTAssertEqual(sum.cholesterol, 70)
        XCTAssertEqual(sum.sodium, 70)
        XCTAssertEqual(sum.carbohydrates, 62)
        XCTAssertEqual(sum.fiber, 5)
        XCTAssertEqual(sum.sugar, 15)
        XCTAssertEqual(sum.protein, 22)
    }
    
    func testMultiplicationNonNil() throws {
        let nutrition = Nutrition(calories: 150, totalFat: 4.5, saturatedFat: 1.5, transFat: 0, cholesterol: 20,
                                  sodium: 610, carbohydrates: 22, fiber: 1, sugar: 5, protein: 6)
        
        let product = nutrition * 2
        
        XCTAssertEqual(product.calories, 300)
        XCTAssertEqual(product.totalFat, 9)
        XCTAssertEqual(product.saturatedFat, 3)
        XCTAssertEqual(product.transFat, 0)
        XCTAssertEqual(product.cholesterol, 40)
        XCTAssertEqual(product.sodium, 1220)
        XCTAssertEqual(product.carbohydrates, 44)
        XCTAssertEqual(product.fiber, 2)
        XCTAssertEqual(product.sugar, 10)
        XCTAssertEqual(product.protein, 12)
    }
    
    func testMultiplicationWithNils() throws {
        let nutrition = Nutrition(calories: 150, totalFat: 4.5, saturatedFat: 1.5, transFat: nil, cholesterol: 20,
                                  sodium: 610, carbohydrates: 22, fiber: nil, sugar: 5, protein: 6)
        let product = nutrition * 2
        XCTAssertEqual(product.calories, 300)
        XCTAssertEqual(product.totalFat, 9)
        XCTAssertEqual(product.saturatedFat, 3)
        XCTAssertEqual(product.transFat, nil)
        XCTAssertEqual(product.cholesterol, 40)
        XCTAssertEqual(product.sodium, 1220)
        XCTAssertEqual(product.carbohydrates, 44)
        XCTAssertEqual(product.fiber, nil)
        XCTAssertEqual(product.sugar, 10)
        XCTAssertEqual(product.protein, 12)
        
        let nutritionNil = Nutrition()
        let productNil = nutritionNil * 3
        XCTAssertEqual(productNil.calories, nil)
        XCTAssertEqual(productNil.totalFat, nil)
        XCTAssertEqual(productNil.saturatedFat, nil)
        XCTAssertEqual(productNil.transFat, nil)
        XCTAssertEqual(productNil.cholesterol, nil)
        XCTAssertEqual(productNil.sodium, nil)
        XCTAssertEqual(productNil.carbohydrates, nil)
        XCTAssertEqual(productNil.fiber, nil)
        XCTAssertEqual(productNil.sugar, nil)
        XCTAssertEqual(productNil.protein, nil)
    }
    
    func testDivisionNonNil() throws {
        let nutrition = Nutrition(calories: 150, totalFat: 4.5, saturatedFat: 1.5, transFat: 0, cholesterol: 20,
                                  sodium: 610, carbohydrates: 22, fiber: 1, sugar: 5, protein: 6)
        
        let quotient = nutrition / 0.5
        
        XCTAssertEqual(quotient.calories, 300)
        XCTAssertEqual(quotient.totalFat, 9)
        XCTAssertEqual(quotient.saturatedFat, 3)
        XCTAssertEqual(quotient.transFat, 0)
        XCTAssertEqual(quotient.cholesterol, 40)
        XCTAssertEqual(quotient.sodium, 1220)
        XCTAssertEqual(quotient.carbohydrates, 44)
        XCTAssertEqual(quotient.fiber, 2)
        XCTAssertEqual(quotient.sugar, 10)
        XCTAssertEqual(quotient.protein, 12)
    }
    
    func testDivisionWithNils() throws {
        let nutrition = Nutrition(calories: 150, totalFat: 4.5, saturatedFat: 1.5, transFat: nil, cholesterol: 20,
                                  sodium: 610, carbohydrates: 22, fiber: nil, sugar: 5, protein: 6)
        
        let quotient = nutrition / 0.5
        
        XCTAssertEqual(quotient.calories, 300)
        XCTAssertEqual(quotient.totalFat, 9)
        XCTAssertEqual(quotient.saturatedFat, 3)
        XCTAssertEqual(quotient.transFat, nil)
        XCTAssertEqual(quotient.cholesterol, 40)
        XCTAssertEqual(quotient.sodium, 1220)
        XCTAssertEqual(quotient.carbohydrates, 44)
        XCTAssertEqual(quotient.fiber, nil)
        XCTAssertEqual(quotient.sugar, 10)
        XCTAssertEqual(quotient.protein, 12)
    }
    
    func testEquality() throws {
        let nutrition1 = Nutrition(calories: 150, totalFat: 4.5, saturatedFat: 1.5, transFat: nil, cholesterol: 20,
                                   sodium: 610, carbohydrates: 22, fiber: nil, sugar: 5, protein: 6)
        let nutrition2 = Nutrition(calories: 150, totalFat: 4.5, saturatedFat: 1.5, transFat: nil, cholesterol: 20,
                                   sodium: 610, carbohydrates: 22, fiber: nil, sugar: 5, protein: 6)
        
        XCTAssertEqual(nutrition1, nutrition2)
        XCTAssertNotEqual(nutrition1, Nutrition.zero)
    }

}
