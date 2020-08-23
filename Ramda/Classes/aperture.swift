//
//  aperture.swift
//  RamdaSwift
//
//  Created by Tonny on 23/08/20.
//

import Foundation

extension Ramda {
    
    static func aperture<A>(_ a: Int, _ b: [A]) -> [[A]] {
        guard a >= 0 && a <= b.count else { return [] }
        
        if a == 0 {
            return (0..<b.count).map {
                Array(b[$0..<($0+a)])
            }
        }
        
        return (0...b.count-a).map {
            Array(b[$0..<($0+a)])
        }
    }
}


extension Ramda {
    
    static func aperture<A>(_ a: Int) -> ([A]) -> [[A]] {
        curry(aperture)(a)
    }
}

extension Ramda {
    
    static func aperture<A>(_ p: Placeholder) -> (Int) -> ([A]) -> [[A]] {
        curry(aperture)
    }
    
    static func aperture<A>(_ a: Int, _ p: Placeholder) -> ([A]) -> [[A]] {
        curry(aperture)(a)
    }
    
    static func aperture<A>(_ p: Placeholder, _ b: [A]) -> (Int) -> [[A]] {
        flip(curry(aperture))(b)
    }
}
