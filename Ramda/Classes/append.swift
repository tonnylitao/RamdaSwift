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
    
    static func append<A>(_ p: Placeholder, _ b: [A]) -> (A) -> [A] {
        { a in
            append(a, b)
        }
    }
    
    static func append<A>(_ a: A, _ p: Placeholder) -> ([A]) -> [A] {
        { b in
            append(a, b)
        }
    }
}
