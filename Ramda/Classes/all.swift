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
    
    static func all<A>(_ a: @escaping (A) -> Bool, _ p: Placeholder) -> ([A]) -> Bool {
        { b in
            all(a, b)
        }
    }
    
    static func all<A>(_ p: Placeholder, _ b: [A]) -> (@escaping (A) -> Bool) -> Bool {
        { a in
            all(a, b)
        }
    }
}
