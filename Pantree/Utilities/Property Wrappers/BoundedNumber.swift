//
//  BoundedNumber.swift
//  Pantree
//
//  Created by Ben Hollar on 4/16/21.
//

import Foundation

/// Stores a number that is clamped within specified bounds
@propertyWrapper
public struct BoundedNumber {
    private var minimumValue: Double?
    private var maximumValue: Double?
    private var number: Double?
    
    public var wrappedValue: Double? {
        get { return number }
        set {
            if let value = newValue {
                do {
                    let clampedValue = try value.clamp(between: minimumValue ?? -.infinity, maximumValue ?? .infinity)
                    number = clampedValue
                    Logging.logger.trace("Value '\(value)' clamped to '\(clampedValue)'")
                } catch ArithmeticError.InvalidBounds {
                    Logging.logger.error("Attempted to clamp value with invalid bounds. Result is `nil`.")
                    number = nil
                } catch {
                    Logging.logger.error("Unexpected exception: \(error.localizedDescription)")
                }
            } else {
                number = nil
            }
        }
    }
    
    public init(wrappedValue: Double? = nil, minimum: Double? = nil, maximum: Double? = nil) {
        self.minimumValue = minimum
        self.maximumValue = maximum
        self.wrappedValue = wrappedValue
    }
}

extension BoundedNumber : Codable { }
