//
//  Stubbable.swift
//  Pantree
//
//  Created by Ben Hollar on 4/29/21.
//

import Foundation

/// Types conforming to `Stubbable` provide data stubs, useful as predictable input for unit testing or when mocking user interfaces.
public protocol Stubbable {
    
    /// A singular instance of the `Stubbable` type
    static var stub: Self { get }
    
    /// A collection of instances of the `Stubbable` type
    static var stubs: [Self] { get }
    
}
