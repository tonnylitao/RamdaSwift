//
//  any.swift
//  RamdaSwift
//
//  Created by Tonny on 23/08/20.
//

import Foundation

extension Ramda {
    
    static func any<A>(_ a: (A) -> Bool, _ b: [A]) -> Bool {
        b.first(where: a) != nil
    }

}

extension Ramda {
    
    static func any<A>(_ a: @escaping (A) -> Bool) -> ([A]) -> Bool {
        curry(any)(a)
    }
}

extension Ramda {
    
    static func any<A>(_ p: Placeholder) -> (@escaping (A) -> Bool) -> ([A]) -> Bool {
        curry(any)
    }
    
    static func any<A>(_ a: @escaping (A) -> Bool, _ p: Placeholder) -> ([A]) -> Bool {
        curry(any)(a)
    }
    
    static func any<A>(_ p: Placeholder, _ b: [A]) -> (@escaping (A) -> Bool) -> Bool {
        flip(curry(any))(b)
    }
}
