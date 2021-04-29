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
    
    // MARK: - Weight Measures
    static let gram = UnitFood(symbol: "g", converter: UnitConverterLinear(coefficient: 1))
    static let ounce = UnitFood(symbol: "oz", converter: UnitConverterLinear(coefficient: 28.35))
    static let pound = UnitFood(symbol: "lb", converter: UnitConverterLinear(coefficient: 453.59237))
    
    // MARK: - Volume Measures
    // Volumetric measures are converted to our base unit, grams (a weight measure) assuming the density of water
    
    static let milliliter = UnitFood(symbol: "mL", converter: UnitConverterLinear(coefficient: 1))
    static let teaspoon = UnitFood(symbol: "tsp", converter: UnitConverterLinear(coefficient: 4.92892))
    static let tablespoon = UnitFood(symbol: "tbsp", converter: UnitConverterLinear(coefficient: 14.7868))
    static let fluidOunce = UnitFood(symbol: "fl oz", converter: UnitConverterLinear(coefficient: 29.574))
    static let cup = UnitFood(symbol: "cup", converter: UnitConverterLinear(coefficient: 8 * 29.574))
}
