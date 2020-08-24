//
//  apply.swift
//  Pods-Ramda_Tests
//
//  Created by Tonny on 23/08/20.
//

import Foundation

extension Ramda {
    
    static func apply<A, B>(_ f: (A) -> B, _ a: A) -> B {
        f(a)
    }
}

extension Ramda {
    
    static func apply<A, B>(_ f: (@escaping (A) -> B), _ p: Placeholder) -> (A) -> B {
        { a in
            apply(f, a)
        }
    }
    
    static func apply<A, B>(_ p: Placeholder, _ a: A) -> (@escaping (A) -> B) -> B {
        { f in
            apply(f, a)
        }
    }
}
