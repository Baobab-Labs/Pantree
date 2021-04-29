//
//  Errors.swift
//  Pantree
//
//  Created by Ben Hollar on 4/16/21.
//

import Foundation

/// A collection of errors relating to arithmetic operations
public enum ArithmeticError : Error {
    /// Error when trying to bound a value between a given `min` and `max`. This error generally indicates that the bounds specified violate an assumed
    /// constraint where `min <= max`.
    ///
    /// - Parameters:
    ///   - `min`: The minimum bound
    ///   - `max`: The maximum bound
    case InvalidBounds(Double, Double)
}
