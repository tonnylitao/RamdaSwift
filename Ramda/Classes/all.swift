//
//  all.swift
//  RamdaSwift
//
//  Created by Tonny on 22/08/20.
//

import Foundation

extension Ramda {
    
    static func all<A>(_ a: (A) -> Bool, _ b: [A]) -> Bool {
        b.allSatisfy(a)
    }

}

extension Ramda {
    
    static func all<A>(_ a: @escaping (A) -> Bool) -> ([A]) -> Bool {
        curry(all)(a)
    }
}

extension Ramda {
    
    static func all<A>(_ p: Placeholder) -> (@escaping (A) -> Bool) -> ([A]) -> Bool {
        curry(all)
    }
    
    static func all<A>(_ a: @escaping (A) -> Bool, _ p: Placeholder) -> ([A]) -> Bool {
        curry(all)(a)
    }
    
    static func all<A>(_ p: Placeholder, _ b: [A]) -> (@escaping (A) -> Bool) -> Bool {
        flip(curry(all))(b)
    }
}
