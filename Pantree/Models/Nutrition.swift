//
//  Nutrition.swift
//  Pantree
//
//  Created by Ben Hollar on 4/15/21.
//

import Foundation

/// Container for nutritional information readily found on FDA food labels
public final class Nutrition : Codable {
    
    // MARK: - Properties
    
    /// The amount of calories (kCal)
    @BoundedNumber(minimum: 0) public private(set) var calories: Double? = nil
    
    /// The total fat (grams)
    @BoundedNumber(minimum: 0) public private(set) var totalFat: Double? = nil
    
    /// The saturated fat (grams)
    @BoundedNumber(minimum: 0) public private(set) var saturatedFat: Double? = nil
    
    /// The trans fat (grams)
    @BoundedNumber(minimum: 0) public private(set) var transFat: Double? = nil
    
    /// The cholesterol (milligrams)
    @BoundedNumber(minimum: 0) public private(set) var cholesterol: Double? = nil
    
    /// The sodium (milligrams)
    @BoundedNumber(minimum: 0) public private(set) var sodium: Double? = nil
    
    /// The carbohydrates (grams)
    @BoundedNumber(minimum: 0) public private(set) var carbohydrates: Double? = nil
    
    /// The amount of  fiber (grams)
    @BoundedNumber(minimum: 0) public private(set) var fiber: Double? = nil
    
    /// The amount of sugar  (grams)
    @BoundedNumber(minimum: 0) public private(set) var sugar: Double? = nil
    
    /// The protein content (grams)
    @BoundedNumber(minimum: 0) public private(set) var protein: Double? = nil
    
    init(calories: Double? = nil, totalFat: Double? = nil, saturatedFat: Double? = nil, transFat: Double? = nil,
         cholesterol: Double? = nil, sodium: Double? = nil, carbohydrates: Double? = nil, fiber: Double? = nil,
         sugar: Double? = nil, protein: Double? = nil) {
        self.calories = calories
        self.totalFat = totalFat
        self.saturatedFat = saturatedFat
        self.transFat = transFat
        self.cholesterol = cholesterol
        self.sodium = sodium
        self.carbohydrates = carbohydrates
        self.fiber = fiber
        self.sugar = sugar
        self.protein = protein
    }
    
}

// MARK: - Math Operators

extension Nutrition: Equatable, AdditiveArithmetic, Scalable {
    
    public static var zero: Nutrition {
        return Nutrition(calories: 0,
                         totalFat: 0,
                         saturatedFat: 0,
                         transFat: 0,
                         cholesterol: 0,
                         sodium: 0,
                         carbohydrates: 0,
                         fiber: 0,
                         sugar: 0,
                         protein: 0)
    }
    
    public static func == (lhs: Nutrition, rhs: Nutrition) -> Bool {
        return (lhs.calories == rhs.calories) &&
               (lhs.totalFat == rhs.totalFat) &&
               (lhs.saturatedFat == rhs.saturatedFat) &&
               (lhs.transFat == rhs.transFat) &&
               (lhs.cholesterol == rhs.cholesterol) &&
               (lhs.sodium == rhs.sodium) &&
               (lhs.carbohydrates == rhs.carbohydrates) &&
               (lhs.fiber == rhs.fiber) &&
               (lhs.sugar == rhs.sugar) &&
               (lhs.protein == rhs.protein)
    }
    
    public static func + (lhs: Nutrition, rhs: Nutrition) -> Nutrition {
        return Nutrition(calories: MathUtils.add(lhs.calories, rhs.calories),
                         totalFat: MathUtils.add(lhs.totalFat, rhs.totalFat),
                         saturatedFat: MathUtils.add(lhs.saturatedFat, rhs.saturatedFat),
                         transFat: MathUtils.add(lhs.transFat, rhs.transFat),
                         cholesterol: MathUtils.add(lhs.cholesterol, rhs.cholesterol),
                         sodium: MathUtils.add(lhs.sodium, rhs.sodium),
                         carbohydrates: MathUtils.add(lhs.carbohydrates, rhs.carbohydrates),
                         fiber: MathUtils.add(lhs.fiber, rhs.fiber),
                         sugar: MathUtils.add(lhs.sugar, rhs.sugar),
                         protein: MathUtils.add(lhs.protein, rhs.protein))
    }
    
    public static func - (lhs: Nutrition, rhs: Nutrition) -> Nutrition {
        return Nutrition(calories: MathUtils.subtract(lhs.calories, rhs.calories),
                         totalFat: MathUtils.subtract(lhs.totalFat, rhs.totalFat),
                         saturatedFat: MathUtils.subtract(lhs.saturatedFat, rhs.saturatedFat),
                         transFat: MathUtils.subtract(lhs.transFat, rhs.transFat),
                         cholesterol: MathUtils.subtract(lhs.cholesterol, rhs.cholesterol),
                         sodium: MathUtils.subtract(lhs.sodium, rhs.sodium),
                         carbohydrates: MathUtils.subtract(lhs.carbohydrates, rhs.carbohydrates),
                         fiber: MathUtils.subtract(lhs.fiber, rhs.fiber),
                         sugar: MathUtils.subtract(lhs.sugar, rhs.sugar),
                         protein: MathUtils.subtract(lhs.protein, rhs.protein))
    }
    
    public static func * (lhs: Nutrition, rhs: Double) -> Nutrition {
        return Nutrition(calories: lhs.calories != nil ? lhs.calories! * rhs : nil,
                         totalFat: lhs.totalFat != nil ? lhs.totalFat! * rhs : nil,
                         saturatedFat: lhs.saturatedFat != nil ? lhs.saturatedFat! * rhs : nil,
                         transFat: lhs.transFat != nil ? lhs.transFat! * rhs : nil,
                         cholesterol: lhs.cholesterol != nil ? lhs.cholesterol! * rhs : nil,
                         sodium: lhs.sodium != nil ? lhs.sodium! * rhs : nil,
                         carbohydrates: lhs.carbohydrates != nil ? lhs.carbohydrates! * rhs : nil,
                         fiber: lhs.fiber != nil ? lhs.fiber! * rhs : nil,
                         sugar: lhs.sugar != nil ? lhs.sugar! * rhs : nil,
                         protein: lhs.protein != nil ? lhs.protein! * rhs : nil)
    }
    
}
