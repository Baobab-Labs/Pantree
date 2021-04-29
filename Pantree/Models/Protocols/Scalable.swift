//
//  Scalable.swift
//  Pantree
//
//  Created by Ben Hollar on 4/15/21.
//

import Foundation

/// A type which can be scaled (multiplied, divided) by some scalar
///
/// Implementing types support the following natural syntaxes:
/// - `Type * value`
/// - `value * Type`
/// - `Type / value`
public protocol Scalable {
    
    /// Perform scalar multiplication
    ///
    /// - Parameters:
    ///   - lhs: The object to be scaled
    ///   - rhs: The scalar
    ///
    /// - Returns:
    ///   - A new instance of the same type as `lhs` with scaled values
    static func * (lhs: Self, rhs: Double) -> Self
    
    /// Perform scalar multiplication
    ///
    /// - Parameters:
    ///   - lhs: The scalar
    ///   - rhs: The object to be scaled
    ///
    /// - Returns:
    ///   - A new instance of the same type as `rhs` with scaled values
    static func * (lhs: Double, rhs: Self) -> Self
    
    /// Perform scalar division
    ///
    /// - Parameters:
    ///   - lhs: The object to be scaled
    ///   - rhs: The scalar
    ///
    /// - Returns:
    ///   - A new instance of the same type as `lhs` with scaled values
    static func / (lhs: Self, rhs: Double) -> Self
    
}

public extension Scalable {
    
    static func * (lhs: Double, rhs: Self) -> Self {
        return rhs * lhs
    }
    
    static func / (lhs: Self, rhs: Double) -> Self {
        return lhs * (1 / rhs)
    }
    
}
