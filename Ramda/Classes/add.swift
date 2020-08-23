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
    
    static func add<A: AdditiveArithmetic>(_ a: A) -> (A) -> A {
        curry(add)(a)
    }
}

extension Ramda {
    
    static func add<A: AdditiveArithmetic>(_ a: Placeholder) -> (A) -> (A) -> A {
        curry(add)
    }
    
    static func add<A: AdditiveArithmetic>(_ a: A, _ p: Placeholder) -> (A) -> A {
        curry(add)(a)
    }
    
    static func add<B: AdditiveArithmetic>(_ p: Placeholder, _ b: B) -> (B) -> B {
        flip(curry(add))(b)
    }
}
