//
//  Ingredient.swift
//  Pantree
//
//  Created by Ben Hollar on 4/16/21.
//

import Foundation

/// `Ingredient`s are the building blocks of any `Recipe`. They contain information about the underlying `Food` and specify some measurement of that
/// `Food` to be consumed in the `Recipe`.
public struct Ingredient : Codable {
    
    public var food: Food
    
    public var amount: Measurement<UnitFood>
    
    public var nutrition: Nutrition? {
        get {
            guard let canonicalMeasurement = food.canonicalMeasurement, let canonicalNutrition = food.canonicalNutrition
            else {
                return nil
            }
            
            let convertedAmount = amount.converted(to: canonicalMeasurement.unit) / canonicalMeasurement.value
            return canonicalNutrition * convertedAmount.value
        }
    }
    
    public init(_ food: Food, amount: Measurement<UnitFood>) {
        self.food = food
        self.amount = amount
    }
    
}

extension Ingredient : Equatable {
    
    public static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        return lhs.food == rhs.food &&
               lhs.amount == rhs.amount
    }
    
}
