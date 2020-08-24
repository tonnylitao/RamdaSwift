//
//  adjust.swift
//  RamdaSwift
//
//  Created by Tonny on 22/08/20.
//

import Foundation

extension Ramda {
    
    static func adjust<A>(_ a: Int, _ b: ((A) -> Any), _ c: [A]) -> [Any] {
        guard a < c.count else { return c }
        
        var new: [Any] = c
        new[a] = b(c[a])
        return new
    }
}

extension Ramda {
    
    
    static func adjust<A>(_ p: Placeholder, _ b: @escaping (A) -> Any, _ c: [A]) -> (Int) -> [Any] {
        { a in
            adjust(a, b, c)
        }
    }
    
    static func adjust<A>(_ a: Int, _ p: Placeholder, _ c: [A]) -> (@escaping (A) -> Any) -> [Any] {
        { b in
            adjust(a, b, c)
        }
    }
    
    static func adjust<A>(_ a: Int, _ b: @escaping (A) -> Any, _ p: Placeholder) -> ([A]) -> [Any] {
        { c in
            adjust(a, b, c)
        }
    }
}
