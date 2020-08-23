//
//  append.swift
//  RamdaSwift
//
//  Created by Tonny on 23/08/20.
//

import Foundation

extension Ramda {
    
    static func append<A>(_ a: A, _ b: [A]) -> [A] {
        b + [a]
    }
}

extension Ramda {
    
    static func append<A>(_ a: A) -> ([A]) -> [A] {
        curry(append)(a)
    }
}

extension Ramda {
    
    static func append<A>(_ a: Placeholder) -> (A) -> ([A]) -> [A] {
        curry(append)
    }
    
    static func append<A>(_ a: A, _ p: Placeholder) -> ([A]) -> [A] {
        curry(append)(a)
    }
    
    static func append<A>(_ p: Placeholder, _ b: [A]) -> (A) -> [A] {
        flip(curry(append))(b)
    }
}
