//
//  flip.swift
//  RamdaSwift
//
//  Created by Tonny on 23/08/20.
//

import Foundation

extension Ramda {
    
    static func flip<A, B, C>(_ c: @escaping (A) -> (B) -> C) -> (B) -> (A) -> C {
        { b in
            { a in
                c(a)(b)
            }
        }
    }
}

