//
//  Food.swift
//  Pantree
//
//  Created by Ben Hollar on 4/15/21.
//

import Foundation

/// `Food`s are foundational components of any `Recipe`.
///
/// `Food`s themselves do not belong to any given `Recipe` however; they do not provide a mechanism for manipulating the _amount_ of food a recipe requires.
/// Instead, `Recipe`s are built from `Ingredients`, which _do_ provide such a mechanism.
///
/// Use `Food` as a representation of foods available to a user -- whether that is what's currently stocked in their pantry, or what they are familiar cooking with. Use
/// `Ingredient` to build a `Recipe`.
public struct Food : Codable {
    
    // MARK: - Properties
    
    /// The name of the food
    public var name: String
    
    /// The food's nutritional information per `canonicalMeasurement`
    public private(set) var canonicalNutrition: Nutrition?
    
    /// The food's canonical measurement (e.g. the serving size found on a nutritional label)
    public private(set) var canonicalMeasurement: Measurement<UnitFood>?
    
    // MARK: - Constructors
    
    public init(named name: String,
                canonicalNutrition: Nutrition? = nil,
                canonicalMeasurement: Measurement<UnitFood>? = nil) {
        self.name = name
        self.canonicalNutrition = canonicalNutrition
        self.canonicalMeasurement = canonicalMeasurement
    }
    
}

extension Food : Equatable {
    
    public static func == (lhs: Food, rhs: Food) -> Bool {
        return lhs.name == rhs.name &&
               lhs.canonicalNutrition == rhs.canonicalNutrition &&
               lhs.canonicalMeasurement == rhs.canonicalMeasurement
    }
    
}

extension Food : Stubbable {
    
    public static var stub: Food {
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
        return food
    }
    
    public static var stubs: [Food] {
        return [
            Food.stub,
            Food(named: "Garlic"),
            Food(named: "Salmon")
        ]
    }
    
}
