//
//  UnitFood.swift
//  Pantree
//
//  Created by Ben Hollar on 4/15/21.
//

import Foundation

public class UnitFood : Dimension {
    
    override public class func baseUnit() -> Self {
        return UnitFood.gram as! Self
    }
    
    public class func allUnits() -> [UnitFood] {
        return [
            UnitFood.genericUnit, UnitFood.gram, UnitFood.ounce, UnitFood.pound, UnitFood.milliliter, UnitFood.teaspoon,
            UnitFood.tablespoon, UnitFood.fluidOunce, UnitFood.cup
        ]
    }
    
    // MARK: - Generic Measures
    // These measures necessarily do not provide useful conversions, but nevertheless will be used in recipes when
    // "measuring" food. An example use-case is a recipe which asks for "1 apple" -- most people will not know that X
    // grams of apple is one apple, so the unit becomes nondescript.
    //
    // For all of these measures, use a coefficient of 1 for the conversion. No application, without additional data,
    // will be able to convert "1 unit X" to "Y grams X" meaningfully, so we will use a 1:1 ratio as a placeholder.
    static let genericUnit = UnitFood(symbol: "units", converter: UnitConverterLinear(coefficient: 1))
    
    // MARK: - Weight Measures
    static let gram = UnitFood(symbol: "g", converter: UnitConverterLinear(coefficient: 1))
    static let ounce = UnitFood(symbol: "oz.", converter: UnitConverterLinear(coefficient: 28.35))
    static let pound = UnitFood(symbol: "lb.", converter: UnitConverterLinear(coefficient: 453.59237))
    
    // MARK: - Volume Measures
    // Volumetric measures are converted to our base unit, grams (a weight measure) assuming the density of water
    
    static let milliliter = UnitFood(symbol: "mL", converter: UnitConverterLinear(coefficient: 1))
    static let teaspoon = UnitFood(symbol: "tsp.", converter: UnitConverterLinear(coefficient: 4.92892))
    static let tablespoon = UnitFood(symbol: "tbsp.", converter: UnitConverterLinear(coefficient: 14.7868))
    static let fluidOunce = UnitFood(symbol: "fl. oz.", converter: UnitConverterLinear(coefficient: 29.574))
    static let cup = UnitFood(symbol: "cup", converter: UnitConverterLinear(coefficient: 8 * 29.574))
}
