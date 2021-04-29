//
//  Recipe.swift
//  Pantree
//
//  Created by Ben Hollar on 4/15/21.
//

import Foundation

public class Recipe : Codable {
    
    public var name: String
    public var ingredients: [Ingredient]
    public var instructions: [String]
    
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
