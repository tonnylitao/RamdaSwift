//
//  curry.swift
//  RamdaSwift
//
//  Created by Tonny on 22/08/20.
//

import Foundation

extension Ramda {
    
    static func curry<A, B, C>(_ f: @escaping (A, B) -> C) -> (A) -> (B) -> C {
        { a in
            { b in
                f(a, b)
            }
        }
    }
    
    static func curry<A, B, C, D>(_ f: @escaping (A, B, C) -> D) -> (A) -> (B) -> (C) -> D {
        { a in
            { b in
                { c in
                    f(a, b, c)
                }
            }
        }
    }
}
