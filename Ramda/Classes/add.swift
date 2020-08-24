//
//  add.swift
//  RamdaSwift
//
//  Created by Tonny on 22/08/20.
//

import Foundation

extension Ramda {
    
    static func add<A: AdditiveArithmetic>(_ a: A, _ b: A) -> A {
        a + b
    }

}

extension Ramda {
    
    static func add<A: AdditiveArithmetic>(_ a: A, _ p: Placeholder) -> (A) -> A {
        { b in
            add(a, b)
        }
    }
    
    static func add<B: AdditiveArithmetic>(_ p: Placeholder, _ b: B) -> (B) -> B {
        { a in
            add(a, b)
        }
    }
}
