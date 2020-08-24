//
//  applySpec.swift
//  Ramda
//
//  Created by Tonny on 23/08/20.
//

import Foundation

extension Ramda {
    
    static func applyTo<A, B>(_ a: A, _ f: (A) -> B) -> B {
        f(a)
    }
}


extension Ramda {
    
    static func applyTo<A, B>(_ p: Placeholder, _ f: (@escaping (A) -> B)) -> (A) -> B {
        { a in
            applyTo(a, f)
        }
    }
    
    static func applyTo<A, B>(_ a: A, _ p: Placeholder) -> (@escaping (A) -> B) -> B {
        { f in
            applyTo(a, f)
        }
    }
}
