//
//  adjust.swift
//  RamdaSwift
//
//  Created by Tonny on 22/08/20.
//

import Foundation

extension Ramda {
    
    static func adjust<A>(_ a: Int, _ b: ((A) -> A), _ c: [A]) -> [A] {
        c.enumerated().map { a == $0 ? b($1) : $1 }
    }
}

extension Ramda {
    
    
    static func adjust<A>(_ p: Placeholder, _ b: @escaping (A) -> A, _ c: [A]) -> (Int) -> [A] {
        { a in
            adjust(a, b, c)
        }
    }
    
    static func adjust<A>(_ a: Int, _ p: Placeholder, _ c: [A]) -> (@escaping (A) -> A) -> [A] {
        { b in
            adjust(a, b, c)
        }
    }
    
    static func adjust<A>(_ a: Int, _ b: @escaping (A) -> A, _ p: Placeholder) -> ([A]) -> [A] {
        { c in
            adjust(a, b, c)
        }
    }
}
