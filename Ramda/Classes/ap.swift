//
//  ap.swift
//  RamdaSwift
//
//  Created by Tonny on 23/08/20.
//

import Foundation

extension Ramda {
    
    static func ap<A, B>(_ a: [(A) -> B], _ b: [A]) -> [B] {
        a.flatMap { f -> [B] in
            b.map { f($0) }
        }
    }
}

extension Ramda {
    
    static func ap<A, B>(_ a: [(A) -> B]) -> ([A]) -> [B] {
        curry(ap)(a)
    }
}

extension Ramda {
    
    static func ap<A, B>(_ p: Placeholder) -> ([(A) -> B]) -> ([A]) -> [B] {
        curry(ap)
    }
    
    static func ap<A, B>(_ a: ([(A) -> B]), _ p: Placeholder) -> ([A]) -> [B] {
        curry(ap)(a)
    }
    
    static func ap<A, B>(_ p: Placeholder, _ b: [A]) -> ([(A) -> B]) -> [B] {
        flip(curry(ap))(b)
    }
}
