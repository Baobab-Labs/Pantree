//
//  Recipe.swift
//  Pantree
//
//  Created by Ben Hollar on 4/15/21.
//

import Foundation

/// A `Recipe` is a collection of `Ingredient`s and instructions that, together, create a fulll demonstration of how to cook a dish.
public struct Recipe : Codable {
    
    /// The name of the Recipe
    public var name: String
    
    /// Each ingredient of the Recipe
    public var ingredients: [Ingredient]
    
    /// Each step of the Recipe
    public var instructions: [String]
    
    /// The aggregate nutrition of the `ingredients` of the Recipe
    ///
    /// The aggregate is the sum of non-`nil` nutritional information provided by `ingredients`. Keep this in mind when using this information, as it can be
    /// potentially misleading to present this value as if every ingredient has nutritional information provided. This value will be non-`nil` even if only one of the
    /// `ingredients` are non-`nil`.
    public var nutrition: Nutrition? {
        get {
            let sum = ingredients.reduce(Nutrition.zero, { lhs, rhs in
                lhs + (rhs.nutrition ?? Nutrition.zero)
            })
            if sum == Nutrition.zero { return nil }
            return sum
        }
    }
    
    public init(named name: String, ingredients: [Ingredient], instructions: [String]) {
        self.name = name
        self.ingredients = ingredients
        self.instructions = instructions
    }
    
}

extension Recipe : Equatable {
    
    public static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.name == rhs.name &&
               lhs.ingredients.elementsEqual(rhs.ingredients) &&
               lhs.instructions.elementsEqual(rhs.instructions)
    }
    
}
