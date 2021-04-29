//
//  Scalable.swift
//  Pantree
//
//  Created by Ben Hollar on 4/15/21.
//

import Foundation

public protocol Scalable {
    associatedtype ScalableType = Self
    
    static func * (lhs: Self, rhs: Double) -> ScalableType
    static func / (lhs: Self, rhs: Double) -> ScalableType
    
}
