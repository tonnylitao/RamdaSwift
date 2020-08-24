//
//  descend.swift
//  Ramda
//
//  Created by Tonny on 24/08/20.
//

import Foundation

extension Ramda {
    
    static func descend<A, B: Comparable>(_ f: @escaping (A) -> B) -> (A, A) -> Bool {
        { a, b in
            f(a) > f(b)
        }
    }
}
