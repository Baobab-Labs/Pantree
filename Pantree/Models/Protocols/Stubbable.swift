//
//  Stubbable.swift
//  Pantree
//
//  Created by Ben Hollar on 4/29/21.
//

import Foundation

/// Types conforming to `Stubbable` provide data stubs, useful as predictable input for unit testing or when mocking user interfaces.
public protocol Stubbable {
    
    static func stub() -> Self
    
}

extension Stubbable {
    func setting<T>(_ keyPath: WritableKeyPath<Self, T>,
                    to value: T) -> Self {
        var stub = self
        stub[keyPath: keyPath] = value
        return stub
    }
}

extension Array where Element: Stubbable {
    static func stub(count: Int) -> Array {
        return (0..<count).map { _ in .stub() }
    }
}

extension MutableCollection where Element: Stubbable {
    func setting<T>(_ keyPath: WritableKeyPath<Element, T>,
                    to value: T) -> Self {
        var collection = self

        for index in collection.indices {
            let element = collection[index]
            collection[index] = element.setting(keyPath, to: value)
        }

        return collection
    }
}
