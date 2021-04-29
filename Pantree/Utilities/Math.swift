//
//  Math.swift
//  Pantree
//
//  Created by Ben Hollar on 4/16/21.
//

import Foundation

public struct MathUtils {
    
    /// Add a nullable type to another.
    ///
    /// If at least one value is not `nil`, the `nil` value is treated as zero for computational purposes. If both values are `nil`, this function returns `nil`.
    ///
    /// - Parameters:
    ///   - lhs: The left-hand side of the addition
    ///   - rhs: The right-hand side of the addition
    ///
    /// - Returns:
    ///   - The result of the addition
    static func add<T: AdditiveArithmetic>(_ lhs: T?, _ rhs: T?) -> T? {
        if lhs != nil && rhs != nil { return  lhs! + rhs! }
        if lhs != nil { return lhs }
        if rhs != nil { return rhs }
        return nil
    }
    
    /// Subtract a nullable type from another.
    ///
    /// If at least one value is not `nil`, the `nil` value is treated as zero for computational purposes. If both values are `nil`, this function returns `nil`.
    ///
    /// - Parameters:
    ///   - lhs: The left-hand side of the subtraction
    ///   - rhs: The right-hand side of the subtraction
    ///
    /// - Returns:
    ///   - The result of the subtraction
    static func subtract<T: AdditiveArithmetic>(_ lhs: T?, _ rhs: T?) -> T? {
        if lhs != nil && rhs != nil { return  lhs! - rhs! }
        if lhs != nil { return lhs }
        if rhs != nil { return T.zero - rhs! }
        return nil
    }
    
}
