//
//  Double.swift
//  Pantree
//
//  Created by Ben Hollar on 4/16/21.
//

import Foundation

extension Double {
    
    /// Clamp the value between two bounds, such that `minimumBound <= value <= maximumBound`
    ///
    /// - Parameters:
    ///   - min: The minimum bound
    func clamp(between min: Double, _ max: Double) throws -> Double {
        if max < min {
            throw ArithmeticError.InvalidBounds
        }
        if self < min {
            return min
        }
        if self > max { return max }
        return self
    }
    
}
