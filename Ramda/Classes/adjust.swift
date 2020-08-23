//
//  adjust.swift
//  RamdaSwift
//
//  Created by Tonny on 22/08/20.
//

import Foundation

extension Ramda {
    
    fileprivate static func _adjust<A>(_ a: Int, _ b: ((A) -> A), _ c: [A]) -> [A] {
        c.enumerated().map { a == $0 ? b($1) : $1 }
    }
    
    static func adjust<A>(_ a: Int, _ b: ((A) -> A), _ c: [A]) -> [A] {
        _adjust(a, b, c)
    }
}

extension Ramda {
    
    static func adjust<A>(_ a: Int) -> (@escaping (A) -> A) -> ([A]) -> [A] {
        curry(_adjust)(a)
    }
    
    static func adjust<A>(_ a: Int, _ b: @escaping (A) -> A) -> ([A]) -> [A] {
        curry(_adjust)(a)(b)
    }
}

extension Ramda {
    
    static func adjust<A>(_ p: Placeholder) -> (Int) -> (@escaping (A) -> A) -> ([A]) -> [A] {
        curry(_adjust)
    }
    
    static func adjust<A>(_ p: Placeholder, _ b: @escaping (A) -> A) -> (Int) -> ([A]) -> [A] {
        { a in
            { c in
                _adjust(a, b, c)
            }
        }
    }
    
    static func adjust<A>(_ p: Placeholder, _ b: @escaping (A) -> A, _ c: [A]) -> (Int) -> [A] {
        { a in
            _adjust(a, b, c)
        }
    }
    
    
    static func adjust<A>(_ a: Int, _ p: Placeholder) -> (@escaping (A) -> A) -> ([A]) -> [A] {
        curry(_adjust)(a)
    }
    
    static func adjust<A>(_ a: Int, _ p: Placeholder, _ c: [A]) -> (@escaping (A) -> A) -> [A] {
        { b in
            _adjust(a, b, c)
        }
    }
    
    static func adjust<A>(_ a: Int, _ b: @escaping (A) -> A, _ p: Placeholder) -> ([A]) -> [A] {
        curry(_adjust)(a)(b)
    }
}
