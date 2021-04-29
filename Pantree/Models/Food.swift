//
//  Food.swift
//  Pantree
//
//  Created by Ben Hollar on 4/15/21.
//

import Foundation

public class Food : Codable {
    
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
